#!/bin/bash

#SBATCH --partition=atesting
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:30:00
#SBATCH --job-name=cp2k
#SBATCH --output=cp2k.%j.out

# Example job showing how to run cp2k container.
# Example input file from:
#  https://www.cp2k.org/exercises:2018_ethz_mmm:h2o_md

ml purge
ml gcc/11.2.0
ml openmpi/4.1.1

export SLURM_EXPORT_ENV=ALL

export APPTAINERENV_OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
mpiexec -np $SLURM_NTASKS apptainer exec --bind /scratch/alpine --env LD_LIBRARY_PATH=/opt/cp2k-toolchain/install/gcc-11.2.0/lib64 $CURC_CONTAINER_DIR/cp2k_9.1.sif /opt/cp2k/exe/local/cp2k.psmp -o md300.out md300.inp
