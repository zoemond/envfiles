export ZENO_ENABLE_FZF_TMUX=1
export ZENO_ENABLE_SOCK=1
export ZENO_FZF_TMUX_OPTIONS="-p 80%"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' '  zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
fi
