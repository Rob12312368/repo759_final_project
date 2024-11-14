#!/usr/bin/env zsh
#SBATCH -p instruction
#SBATCH -J Task
#SBATCH -o Task.out -e Task.err
#SBATCH --cpus-per-task=20

./open_aes