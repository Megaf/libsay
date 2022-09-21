#!/bin/bash
#
# libsay
# terminal_test.sh
# See what your terminal can do.
# This will show what your terminal is able to do with Escape Characters
# for text effects and colours.
#
# Author:       Megaf - https://github.com/Megaf - mmegaf [at] gmail [dot] com
# Date:         21/09/2022
# GitHub:       https://github.com/Megaf/libsay
# License:      GPL V3

# Test function
run_test()
{
    # Sets effect
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
}

run_test # Runs the test

unset -f print_test run_test 

exit 0