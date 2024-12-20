#!/usr/bin/env bash
#SBATCH --job-name=run_CUDA
#SBATCH --partition=instruction
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --time=0-00:00:01
#SBATCH --output=run_AES.out
#SBATCH --error=run_AES.err
#SBATCH --gres=gpu:1  # Request one GPU

# Log in to the submission directory
cd $SLURM_SUBMIT_DIR

module load nvidia/cuda/11.8.0
module load gcc/11.3.0

# Compile the CUDA code (replace 'task3_guided.cu' with your .cu file)
nvcc AES.cu main.cu -Xcompiler -O3 -Xcompiler -Wall -Xptxas -O3 -std c++17 -o aes
./aes 512
./aes 256
./aes 1024
# Run the compiled CUDA program
# for (( i=10; i<=29; i++ )); do
#     n=$((2**i))  # Calculate 2^i

#     # Run your C++ program with n and capture the output
#     # Assuming your C++ program is compiled as `task1` and outputs three numbers on separate lines
#     result=$(./task2 $n 128 512)

#     # Extract the first number from the output (assuming it's the first line of the output)
#     time_taken=$(echo "$result" | tail -n 1)

#     # Write n and time_taken to the output file
#     echo "$i,$time_taken"
# done