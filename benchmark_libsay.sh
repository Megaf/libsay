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
INFO: Welcome to the libsay Benchmark!

Just a simple benchmark to test the lib's
performance on your system.

WARNING: This benchmark depends on 'libsay' and 'tput'.
EOM

say "INFO: The benchmark will run the loop $runs times.
NOTICE: Please press any key to start the benchmark or 'Ctrl c' to quit."
read -n 1 -s

clear
start="$(date +%s.%3N)"
tput sc
read -r -d '' text << EOM
TITLE: libsay Benchmark
Welcome to the libsay Benchmark!
INFO: This benchmark will test the
INFO: performance of your system by
INFO: timing how long it takes to
INFO: print all the text in here.

NOTICE: This is a single core bench.
WARNING: This is not very serious.

DBG: Is there a Debug mode?
DEBUG: Debug message!
ERROR: Nothing went wrong! All good!
EOM

read -r -d '' bench << EOM
NOTICE: Benchmark is already running!
WARNING: Please don't touch anything!
INFO: This message will be printed
INFO: $runs times!
EOM

t=0
while [ "$t" -lt "$runs" ]; do
    tput rc
    say "$text"
    say "$bench"
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
    printf '\n\n%s' "Progress: |" && printf "%0.s=" $(seq 1 "$bar"); printf '%s' ">$p%"
done

end="$(date +%s.%3N)"
total_time="$(echo "scale=3; $end - $start" | bc)"
echo ""
say "INFO: All done"
say "NOTICE: The benchmark took '$total_time' seconds."
unset start end text t runs debug total_time tp p bar libsay_url libsay_destination

exit 0

