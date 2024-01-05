TARGET	= libmatmult.so
LIBSRCS	= matmult.c
LIBOBJS	= $(LIBSRCS:.c=.o)

# OPT = -g O1
# OPT = -g O2
# OPT = -g O3
# OPT = -g Ofast
# OPT = -f Ofast -funroll-loops
# OPT = -f Ofast -funroll-loops -flto
OPT	= -g # base case is without optimizations
PIC	= -fPIC

CC	= gcc
CFLAGS= $(OPT) $(PIC) $(XOPTS)

SOFLAGS = -shared 
XLIBS	= -L /usr/lib64/atlas -lsatlas

$(TARGET): $(LIBOBJS)
	$(CC) -o $@ $(SOFLAGS) $(LIBOBJS) $(XLIBS)

clean:
	@/bin/rm -f core core.* $(LIBOBJS) 
