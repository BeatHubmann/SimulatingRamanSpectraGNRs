#!/bin/bash --login
#SBATCH --job-name="geo"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kristjaneimre+slurm@gmail.com

#SBATCH --nodes=1 # the number of ranks (total)
#SBATCH --ntasks-per-node=12 # the number of ranks per node
##SBATCH --ntasks-per-core=1 # enable this if you want hyperthreading
#SBATCH --cpus-per-task=1 # use this for threaded applications
#SBATCH --time=00:20:00 
#SBATCH --constraint=gpu
#SBATCH --partition=normal

#SBATCH --account=s904

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1
module load daint-gpu

ulimit -s unlimited

EXE=/users/keimre/soft/cp2k_5.1_18265/exe/cray_xc50-gfortran_gpu/cp2k.psmp

#EXE=/users/keimre/soft/cp2k_5.1_18265_z_dipole/exe/cray_xc50-gfortran_gpu/cp2k.psmp

export CP2K_DATA_DIR="/users/keimre/soft/cp2k_5.1_18265/data"

#======START=====
echo "The current job ID is $SLURM_JOB_ID"
echo "Running on $SLURM_JOB_48 nodes"
echo "Using $SLURM_NTASKS_PER_NODE tasks per node"
echo "A total of $SLURM_NTASKS tasks is used"

echo "Starting job at `date`"
echo

srun -n $SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE -c $SLURM_CPUS_PER_TASK --cpu_bind=rank --hint=nomultithread $EXE -i cp2k.inp > cp2k.out

echo
echo "Finished job at `date`"

#=====END=====
