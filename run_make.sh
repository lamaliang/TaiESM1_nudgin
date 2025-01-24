#!/bin/sh

module purge
module use /home/yhtseng00/modulefiles
module load coda/intel/2022.3.1/intelmpi/netcdf/4.9.2 coda/intel/2022.3.1/intelmpi/pnetcdf/1.8.1
module load coda/tools/perl/5.16.3 coda/tools/cmake/3.28.4

make
