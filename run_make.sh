#!/bin/sh

module purge
module load intel-2022/netcdf_intelmpi-2021/4.9.2 intel-2022/hdf5_intelmpi-2021/1.14.3 

make
