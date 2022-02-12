#!/bin/sh

workspace_name=$(i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2)

i3-msg "[con_mark=\"^_workspace_$workspace_name\$\"] fullscreen enable, scratchpad show"
