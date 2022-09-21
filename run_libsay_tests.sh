#!/bin/bash
#
# run_libsay_tests.sh - Version: 1.0-202209.21.180000
# This script checks the functionality of the library.
#
# Author:       Megaf - https://github.com/Megaf - mmegaf [at] gmail [dot] com
# Date:         21/09/2022
# GitHub:       https://github.com/Megaf/libsay
# License:      GPL V3

source libsay

clear

border_colour="light_cyan"
draw \
leftside do_space do_space rightside do_space topleftcorner top top top do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space topleftcorner top top toprightcorner do_godown \
leftside do_space do_space rightside do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space rightside do_godown \
leftside_c line line rightside_c do_space leftside_c line line do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space rightside do_godown \
leftside do_space do_space rightside do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space do_space do_space leftside do_space do_space rightside do_godown \
leftside do_space do_space rightside do_space bottomleftcorner bottom bottom bottom do_space bottomleftcorner bottom bottom bottom do_space bottomleftcorner bottom bottom bottom do_space bottomleftcorner bottom bottom bottomrightcorner do_godown
rst

say "TITLE: Welcome to libsay tests!"

say "INFO: Testing reading from 'EOF' using read"
read -r -d '' message << EOF
TITLE: First line, as a title

NOTICE: Second line, as a notice.

WARNING: The line above is empty, it's a separator.
INFO: Set 'debug=true' to read hidden Debug messages.
DEBUG: You found a DEBUG message!
ERROR: Nothing went wrong, hopefully.
EOF

say "$message"
unset -v message

say "INFO: Testing reading from 'EOF' directly"
say << EOF
TITLE: First line, as a title

NOTICE: Second line, as a notice.

WARNING: The line above is empty, it's a separator.
INFO: Set 'debug=true' to read hidden Debug messages.
DEBUG: You found a DEBUG message!
ERROR: Nothing went wrong, hopefully.
EOF

say "INFO: Testing reading using double quotes"
say "TITLE: First line, as a title

NOTICE: Second line, as a notice.

WARNING: The line above is empty, it's a separator.
INFO: Set 'debug=true' to read hidden Debug messages.
DEBUG: You found a DEBUG message!
ERROR: Nothing went wrong, hopefully."

say "INFO: Testing pre-defines schemes with 'scheme_name; printf':"
schemes=(
"c_error" "c_info" "c_warning"
"c_debug" "c_notice" "c_title" "c_normal"
)
for predefined in "${schemes[@]}"; do
    rst; $predefined; printf "Predefined scheme '$predefined'"; rst; printf "\n"
done
unset -v schemes predefined

say "INFO: Testing text alignment with 'say --align':"
aligns=("left" "centre" "right")
for justify in "${aligns[@]}"; do
    say "INFO: Aligning to the $justify."
    rst; say --align "$justify" "test"
done
unset -v justify aligns

say "INFO: Testing all available colours:"
colours=(
"red" "green" "blue" "yellow" "magenta" "cyan"
"grey" "white" "black" "bright_white"
"light_red" "light_green" "light_blue" "light_yellow" "light_magenta" "light_cyan"
)

say "INFO: Testing foreground text colours with 'say --colour colour':"
for this_colour in "${colours[@]}"; do
    rst; say --colour "$this_colour" "Colour is: '$this_colour'"
done

say "INFO: Testing background text colours with 'set_colour bg colour; printf':"
for this_colour in "${colours[@]}"; do
    rst; set_colour bg "$this_colour"; printf "Colour is: '$this_colour'"; rst; printf "\n"
done

say "INFO: Testing box border colour with 'border_colour=colour say':"
for this_colour in "${colours[@]}"; do
    rst; border_colour="$this_colour" say "Colour is: '$this_colour'"
done
unset -v colours this_colour border_colour

say "INFO: Testing all supported text styles and effects with effect_name; echo':"
effects=(
"underline_on" "double_underline_on" "overline_on" "overunder_on" "bold_on"
"invert_on" "blink_on" "italics_on" "crossout_on" "fade_on"
)
for use_effect in "${effects[@]}"; do
    rst; $use_effect; echo "Testing effect '$use_effect'"
done
unset -v use_effect effects

say "INFO: Testing available border styles with 'style=\$style say':"
styles=(
"boxdoubleline" "boxverticalsinglehorizontaldouble" "boxverticaldoublehorizontalsingle"
"boxsingleline" "boxsolid" "null"
)
for this_style in "${styles[@]}"; do
    rst; style="$this_style" say "Style '$this_style'"
done
unset -v this_style style styles

border_colour="light_green"
draw \
topleftcorner top toprightcorner do_space        do_space   leftside do_space do_space rightside           do_space    topleftcorner top top top do_godown \
leftside do_space rightside do_space             do_space   leftside do_space do_space rightside           do_space    leftside do_space do_space do_space do_godown \
leftside_c line bottom_c toprightcorner          do_space   bottomleftcorner line top_c bottomrightcorner  do_space    leftside_c line line do_space do_godown \
leftside do_space do_space rightside             do_space   do_space do_space column do_space              do_space    leftside do_space do_space do_space do_godown \
bottomleftcorner bottom bottom bottomrightcorner do_space   do_space do_space column do_space              do_space    bottomleftcorner bottom bottom bottom do_godown
rst

unset -v border_colour

exit 0
