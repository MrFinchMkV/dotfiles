#!/bin/bash

_trigger_polybar_windows_number() {
    desktop_layout=$(bspc query -T -d | jq -r .layout)
    if [[ $desktop_layout == "monocle" || $desktop_layout == "tiled" ]]; then
        (polybar-msg action "#bspwm-monocle-nb-windows.hook.0") &>/dev/null
      else
        (polybar-msg action "#bspwm-monocle-nb-windows.hook.1") &>/dev/null
    fi

}

bspc subscribe desktop_layout desktop_focus node_add node_remove node_stack node_focus | while read -ra line
do
    case "$line" in
        desktop_focus)
            _trigger_polybar_windows_number
            ;;

        desktop_layout)
            _trigger_polybar_windows_number
            ;;

        node_add)
            _trigger_polybar_windows_number
            ;;

        node_stack)
            _trigger_polybar_windows_number
            ;;

        node_remove)
            _trigger_polybar_windows_number
            ;;
    esac
done
