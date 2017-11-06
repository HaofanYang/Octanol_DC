#!/bin/bash
#SBATCH -o analyse-free-nrg-LJ-%A.%a.out
#SBATCH -p serial
#SBATCH -n 1
#SBATCH --time 24:00:00

module load sire/17.1.0_no_avx
export OPENMM_PLUGIN_DIR=/home/julien/sire.app/lib/plugins

cd lambda-0.000
srun lj-tailcorrection -C ../../input/sim.cfg -l 0.00 -r traj000000001.dcd -s 100 1> ../freenrg-LJCOR-lam-0.000.dat 2> /dev/null

wait

cd ..
cd lambda-1.000
srun lj-tailcorrection -C ../../input/sim.cfg -l 1.00 -r traj000000001.dcd -s 100 1> ../freenrg-LJCOR-lam-1.000.dat 2> /dev/null

wait
cd ..

wait

# utility script to get final LJ correction term
python /home/julien/local/bin/parselj.py freenrg-LJCOR-lam-0.000.dat freenrg-LJCOR-lam-1.000.dat > freenrg-LJCOR.dat
