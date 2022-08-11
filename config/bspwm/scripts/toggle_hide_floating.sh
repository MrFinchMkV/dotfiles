#!/bin/bash

hide_nodes() {
  nodes="$1"

  for node in $nodes; do
    bspc node "$node" --flag hidden=on
    #echo "Toggle: $node"
  done
}

show_nodes() {
  nodes="$1"

  for node in $nodes; do
    bspc node "$node" --flag hidden=off
    #echo "Toggle: $node"
  done
}

floating_nodes=$(bspc query --nodes --node .floating --desktop)
hidden_nodes=$(bspc query --nodes --node .hidden --desktop)

if [ ! -z "${hidden_nodes}" ]; then
  floating_nodes_array=(${floating_nodes})
  show_nodes "$hidden_nodes"
  #echo "${floating_nodes[0]}"
  bspc node --focus "${floating_nodes_array[0]}"
else
  hide_nodes "$floating_nodes"
fi

