#!/bin/bash -l
#SBATCH --job-name="raman_12units_7agnr_defect_N"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bhubmann@student.ethz.ch

#SBATCH --nodes=48
#SBATCH --ntasks-per-node=12

#SBATCH --time=24:00:00 
#SBATCH --constraint=gpu
#SBATCH --partition=normal

#SBATCH --account=s904

#==============================================================================

module load daint-gpu
module load CP2K

export OMP_NUM_THREADS=1
export CRAY_CUDA_MPS=1

ulimit -s unlimited

echo "Job: $SLURM_JOB_ID"
echo "Tasks: $SLURM_NTASKS"
echo "Tasks-per-node: $SLURM_NTASKS_PER_NODE"

srun -n $SLURM_NTASKS cp2k.psmp -i cp2k.inp -o cp2k.out
