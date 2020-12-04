
FC = gfortran-6.2.0
OMP = -fopenmp

FFLAGS = -O2 $(OMP) -fmax-errors=3
TARGET = eigen 

SOURCES = eigen.f90

OBJS = $(SOURCES:.f90=.o)

LAPACKDIR=../lapack/lapack-3.7.0
LAPACK = -L$(LAPACKDIR) -llapack -lrefblas
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



