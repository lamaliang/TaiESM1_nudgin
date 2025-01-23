# ------------------------------------------------------------------------------
# read_netcdf Makefile
#
# By Hsin-Chien Liang @ LCCR/RCEC Academia Sinica 2016.12.27
# ------------------------------------------------------------------------------

FC       := ifort 
FFLAGS   := -g -O2 -r8
INCLUDES := -I${NETCDF}/include -I/work/j07hsu00/taiesm_work/f02.t12.B2000.hi22f2/bld/intel/intelmpi/nodebug/nothreads/include
LIBS     := -L${NETCDF}/lib -lnetcdff -lnetcdf -lz 

TARGETS  := code_nudge.exe 

MOD_PATH := /work/j07hsu00/taiesm_work/f02.t12.B2000.hi22f2/bld/bld/atm/obj
MOD_FILES := $(wildcard $(MOD_PATH)/*.mod)

all: $(TARGETS)

code_nudge.exe: code_nudge.o $(MOD_FILES)
	$(FC) -o $@ $^ $(OBJECTS) $(LIBS)

code_nudge.o: code_nudge.f90 $(OBJECTS) $(MOD_FILES)
	$(FC) $(FFLAGS) $(INCLUDES) -c -o $@ $<

%.o: %.f90
	$(FC) $(FFLAGS) $(INCLUDES) -c -o $@ $<

clean:
	-rm -rf *.o *.mod $(TARGETS)
