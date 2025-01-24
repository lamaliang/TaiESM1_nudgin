# ------------------------------------------------------------------------------
# read_netcdf Makefile
#
# By Hsin-Chien Liang @ LCCR/RCEC Academia Sinica 2016.12.27
# ------------------------------------------------------------------------------
FC       := mpiifort

FFLAGS   := -ip -qno-opt-dynamic-align -fp-model source -convert big_endian -assume byterecl -ftz -traceback -assume realloc_lhs -O2 -xAVX -r8 -fpp

CFLAGS   := -O2 -fp-model precise -xAVX

CPPDEFS  := -DFORTRANUNDERSCORE -DNO_R16 -DLinux -DCPRINTEL

INCLUDES := -I$(NETCDF_PATH)/include -I$(HDF5_PATH)/include -I./modules
LIBS     := -L$(NETCDF_PATH)/lib -lnetcdff -lnetcdf \
            -L$(HDF5_PATH)/lib -lhdf5_hl -lhdf5 \
            -L./modules

TARGETS  := code_nudge.exe
OBJECTS  := modules/phys_grid.o modules/mpishorthand.o modules/time_manager.o

all: $(TARGETS)

$(TARGETS): code_nudge.o $(OBJECTS)
	$(FC) $(FFLAGS) $(CPPDEFS) -o $@ $^ $(LIBS)

code_nudge.o: code_nudge.f90 $(OBJECTS)
	$(FC) $(FFLAGS) $(CPPDEFS) $(INCLUDES) -c -o $@ $<

%.o: %.f90
	$(FC) $(FFLAGS) $(CPPDEFS) $(INCLUDES) -c -o $@ $<

clean:
	rm -f *.o *.mod $(TARGETS)

