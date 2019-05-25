function debug_color
printf "%s%s%s" ( set_color -b white $argv[1] ) $argv[1] (set_color normal)
end
