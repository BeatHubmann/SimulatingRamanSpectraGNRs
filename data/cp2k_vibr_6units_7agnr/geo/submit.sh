#!/bin/bash -l
#SBATCH --job-name="geo_6units_7agnr"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bhubmann@student.ethz.ch

#SBATCH --nodes=8 # the number of ranks (total)
#SBATCH --ntasks-per-node=12

#SBATCH --time=24:00:00 
#SBATCH --constraint=gpu
#SBATCH --partition=normal

#SBATCH --account=s904

#==============================================================================

module load daint-gpu
module load CP2K

#export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}
export OMP_NUM_THREADS=1
export CRAY_CUDA_MPS=1

ulimit -s unlimited

echo "Job: $SLURM_JOB_ID"
echo "Tasks: $SLURM_NTASKS"
echo "Tasks-per-node: $SLURM_NTASKS_PER_NODE"
echo "CPUs-per-tasks: $SLURM_CPUS_PER_TASK"

srun -n $SLURM_NTASKS cp2k.psmp -i cp2k.inp -o cp2k.out
# srun -n $SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE -c $SLURM_CPUS_PER_TASK --cpu_bind=rank --hint=nomultithread cp2k.psmp -i cp2k.inp -o cp2k.out
