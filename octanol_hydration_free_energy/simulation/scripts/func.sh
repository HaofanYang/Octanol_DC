#!/bin/bash
#SBATCH -o somd-array-gpu-%A.%a.out
#SBATCH -p serial
#SBATCH -n 1
#SBATCH --time 48:00:00

module load sire/16.1.0_no_avx

cp ../func.py  lambda-0.000/.
cd lambda-0.000


srun /home/common/sire.app_16.1.0_no_AVX/bin/python func.py > ../freenrg-FUNC.dat

wait

cd ../


