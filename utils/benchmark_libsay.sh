#!/bin/bash
#
# benchmark_libsay.sh
# Simple libsay benchmark.
#
# Author: Megaf - https://github.com/Megaf/ - mmegaf [at] gmail [dot] com
# Date: 14/09/2022
# License: GPL 3
# URL/GitHub: https://github.com/Megaf/libsay/
#
# Usage:
# './benchmark_libsay.sh' to run it with the defaut 50 runs set.
# './benchmark_libsay.sh n' where n is the number of runs you want to try.

source libsay
[ -z "$*" ] && runs=50 || runs="$*"
clear
rst

say << EOM
TITLE: libsay Benchmark
INFO: Welcome to the
INFO: libsay Benchmark!

Just a simple benchmark
to test the lib's
performance on your system.

WARN: This benchmark depends
WARN: on 'libsay' and 'tput'.
EOM

say "INFO: The benchmark will
INFO: run the loop $runs times.
NOTICE: Please press any key
NOTICE: to start the benchmark
NOTICE: or 'Ctrl c' to quit."
read -n 1 -s

clear
tput sc
read -r -d '' bench_text << EOM
TITLE: libsay Benchmark
Welcome to the libsay Benchmark!
INFO: This benchmark will test the
INFO: performance of your system by
INFO: timing how long it takes to
INFO: print all the text/box in here.

NOTICE: This is a single core bench.
WARNING: This is not very serious.

DBG: Is there a Debug mode?
DEBUG: Debug message!
ERROR: Nothing went wrong! All good!
EOM

read -r -d '' text_bench << EOM
NOTICE: Benchmark is already running!
WARNING: Please don't touch anything!
INFO: This message will be printed
INFO: $runs times!
EOM

do_libsay_benchmark()
{
    debug=true
    t=0
    while [ "$t" -lt "$runs" ]; do
        tput rc
        say "$bench_text"
        say "$text_bench"
        draw topleftcorner
        draw top
        draw top
        draw top
        draw toprightcorner
        draw do_godown
        draw leftside
        draw do_space
        draw do_space
        draw do_space
        draw rightside
        draw do_godown
        draw bottomleftcorner
        draw bottom
        draw bottom
        draw bottom
        draw bottomrightcorner
        t="$((t+1))"
        tp="$((t*100))"
        p="$(expr $tp / $runs)"
        bar="$(expr $p / 10)"
        printf '\n\n%s' "Progress: |"
        printf "%0.s=" "$(seq 1 "$bar")"
        printf '%s' ">$p%"
    done
}    
start="$(date +%s.%3N)"
do_libsay_benchmark
end="$(date +%s.%3N)"
total_time="$(echo "scale=3; $end - $start" | bc)"
clear

read -r -d '' final_text << EOF
INFO: All done

NOTICE: Time taken:
$total_time seconds.
EOF

say "$final_text"
unset start end text_bench bench_text t runs debug total_time tp p bar libsay_url libsay_destination final_text

exit 0

