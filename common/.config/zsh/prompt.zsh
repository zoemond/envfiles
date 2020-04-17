# -----------------------------
# Prompt
# -----------------------------

# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))

## -----------------------------
## for git
## ----------------------------- 
autoload -Uz vcs_info
## %b ブランチ情報
## %a アクション名(mergeなど)
## %c changes
## %u uncommit 
function reset_color(){
	echo "%f%k"$1
}
function to_normal_color(){
	echo "%K{white}%F{233}"$1"%f%k"
}
function to_yellow_bg(){
	echo "%K{yellow}%F{233}"$1"%f%k"
}
function to_green_bg(){
	echo "%K{green}%F{233}"$1"%f%k"
}
function to_red_bg(){
	echo "%K{red}%F{white}"$1"%f%k"
}

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3 

# git 用のフォーマット
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' actionformats '[%b]' '%c%u %m' '<!%a>' 
zstyle ':vcs_info:git*' formats "[%b]%m"

zstyle ':vcs_info:git*+set-message:*' hooks git-is-inside-work-tree \
				            git-compare-local-remote \
				            git-status

# フックの最初の関数
# git あるディレクトリのみフック関数を呼び出すようにする
# (.git ディレクトリ内にいるときは呼び出さない)
# .git ディレクトリ内では git status --porcelain などがエラーになるため
function +vi-git-is-inside-work-tree() {
    if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        # 0以外を返すとそれ以降のフック関数は呼び出されない
        return 1
    fi

    return 0
}

### Compare local changes to remote changes 
### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-compare-local-remote() {
    local ahead behind
    local -a pushed_status

    # for git prior to 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | command grep -c '')
    (( $ahead )) && pushed_status+=( "↑${ahead}" )

    # for git prior to 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | command grep -c '')
    (( $behind )) && pushed_status+=( "↓${behind}" )

    hook_com[misc]+=$(reset_color ${(j:/:)pushed_status})
}

### Display the existence of files not yet known to VCS 
### Display the status of files
# Make sure you have added staged to your 'formats':  %m 
+vi-git-status(){
    local gitstatus untracked_number modified_number added_number
    gitstatus=$(git status --porcelain 2>/dev/null) 

    added_number=$(echo $gitstatus | command grep -e '^A' -e '^M ' -e '^D ' 2>/dev/null | command grep -c '')
    modified_number=$(echo $gitstatus | command grep -e '^ M' -e '^MM' -e '^ D' 2>/dev/null | command grep -c '')
    untracked_number=$(echo $gitstatus | command grep '^??' 2>/dev/null | command grep -c '') 

    if [ "$added_number" != '' ] ; then 
        hook_com[misc]+=$( to_green_bg '+'$added_number )
    fi 
    if [ "$modified_number" != '' ] ; then 
        hook_com[misc]+=$( to_red_bg '+'$modified_number )
    fi 

    if [ "$untracked_number" != '' ] ; then 
        hook_com[misc]+=$( to_yellow_bg '?'$untracked_number )
    else
        hook_com[misc]+=''
    fi 
} 


function _update_prompt_with_vcs_info() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=$( to_normal_color ${vcs_info_msg_0_} )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=$( to_yellow_bg ${vcs_info_msg_1_} )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=$( to_red_bg ${vcs_info_msg_2_} )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
    fi

    echo "$prompt"
}

function _update_prompt(){
    local vcs_info=`_update_prompt_with_vcs_info`
    PROMPT="
%K{white}%F{233}%T%{${reset_color}%}%f%k $vcs_info %K{245}%F{233}[%~]%f%k
» "
}

add-zsh-hook precmd _update_prompt

