#!/bin/bash
#SBATCH -o somd-array-gpu-%A.%a.out
#SBATCH -p Tesla
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --time 48:00:00
#SBATCH --array=0-0

module load cuda/7.5
module load sire/17.1.0_no_avx
echo "CUDA DEVICES:" $CUDA_VISIBLE_DEVICES

cp ../input/sim.cfg . 
cp ../input/SYSTEM.top . 
cp ../input/SYSTEM.crd . 
cp ../input/MORPH.pert . 

export OPENMM_PLUGIN_DIR=/home/julien/sire.app/lib/plugins/

srun somd -C ../input/sim.cfg -t SYSTEM.top -c SYSTEM.crd -p CUDA

wait



