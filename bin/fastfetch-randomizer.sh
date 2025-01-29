#!/usr/bin/env bash

choices=("arch" "ascii-art" "hypr" "groups" "minimal" "nyarch" "os")

random_choice=$(printf "%s\n" "${choices[@]}" | shuf -n 1)

fastfetch --config $random_choice
