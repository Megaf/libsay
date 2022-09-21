#!/bin/bash
#
# libsay
# terminal_test.sh - Version: 202209.21.153112
# See what your terminal can do.
# This will show what your terminal is able to do with Escape Characters
# for text effects and colours.
#
# Author:       Megaf - https://github.com/Megaf - mmegaf [at] gmail [dot] com
# Date:         21/09/2022
# GitHub:       https://github.com/Megaf/libsay
# License:      GPL V3

# Prints the ASCII table.
print_ascii_table()
{
    echo "Printing the ASCII table."
    print_ascii()
    {
        character="$i"
        command=`printf %x $i`
        printf "%sASCII code $i: "; printf "'"; printf "\x$command"; printf "'\n"
    }

    for i in {32..126}; do
        print_ascii "$i"
    done
    unset -v character command i

    for i in {128..254}; do
        print_ascii "$i"
    done     
    unset -v character command i
    unset -f print_ascii
}

# Test terminals capabilities for text effects via Escape Characters.
run_test()
{
    echo "Testing terminal's capabilities."
    print_test()
    {
        printf "\e[0m\n"; printf "\e["$run_number"m"
        printf "Text example."; printf "\e[0m\n"
        printf "\n"
    }

    local run_amount="128" # Total number of "effects" to try.
    local run_number="0"
    printf "Testing text effects.\n"
    while [ "$run_number" -le "29" ]; do
        printf "Effect number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing normal foreground colours.\n"
    while [ "$run_number" -le "39" ]; do
        printf "Colour number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing normal background colours.\n"
    while [ "$run_number" -le "49" ]; do
        printf "Colour number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing aditional text effects.\n"
    while [ "$run_number" -le "89" ]; do
        printf "Effect number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing light foreground colours.\n"
    while [ "$run_number" -le "99" ]; do
        printf "Colour number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing light background colours.\n"
    while [ "$run_number" -le "109" ]; do
        printf "Colour number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    printf "Testing aditional extra effects.\n"
    while [ "$run_number" -le "$run_amount" ]; do
        printf "Effect number: $run_number"
        print_test
        local run_number="$((++run_number))"
    done
    unset -v run_amount run_number
    unset -f print_test
}

run_test
print_ascii_table
unset -f run_test print_ascii_table

exit 0