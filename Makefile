
FC = gfortran
OMP = -fopenmp

FFLAGS = -O2 $(OMP) -fmax-errors=3
TARGET = linear

SOURCES = linear.f90

OBJS = $(SOURCES:.f90=.o)

LAPACKDIR = ../lapack-3.9.0
LAPACK = -L$(LAPACKDIR) -llapack -lrefblas

MKLDIR = 
MKLLIB = -L$(MKLDIR) -lmkl_intel_ilp64 -lmkl_intel_thread -lmkl_core -liomp5

LIBS = $(LAPACK)


.SUFFIXES:
.SUFFIXES: .f90 .o

.f90.o: 
	$(FC) $(FFLAGS) -c  $<

all: $(OBJS)
	$(FC) $(OMP) -o $(TARGET) $(OBJS) $(LIBS)

clean:
	rm -f *.o *.mod $(TARGET)

distclean: clean
	rm $(TARGET)


linear.o: precision.o
