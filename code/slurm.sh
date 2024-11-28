#!/usr/bin/env zsh
#SBATCH -p instruction
#SBATCH -J Task
#SBATCH -o Task.out -e Task.err
#SBATCH --cpus-per-task=20

PROGRAM=$1

if [ "$PROGRAM" == "aes" ]; then
    echo "Running aes program"
    ./aes
elif [ "$PROGRAM" == "open" ]; then
    echo "Running open program"
    ./open
else
    echo "Unknown program specified: $PROGRAM"
    exit 1
fi