all: prac

CXXFLAGS=-march=native -std=c++17 -Wall -Wno-ignored-attributes -ggdb -O3
LDFLAGS=-ggdb
LDLIBS=-lbsd -lboost_system -lboost_context -lboost_chrono -lboost_thread -lpthread

# Enable this to have all communication logged to stdout
# CXXFLAGS += -DVERBOSE_COMMS

BIN=prac
SRCS=prac.cpp mpcio.cpp preproc.cpp online.cpp mpcops.cpp \
     cdpf.cpp annoncomm.cpp  
OBJS=$(SRCS:.cpp=.o)
ASMS=$(SRCS:.cpp=.s)

$(BIN): $(OBJS)
	g++ $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.s: %.cpp
	g++ $(CXXFLAGS) -S -o $@ $^

# Remove the files created by the preprocessing phase
reset:
	-rm -f *.p[012].t*

clean: reset
	-rm -f $(BIN) $(OBJS) $(ASMS)

depend:
	makedepend -Y -- $(CXXFLAGS) -- $(SRCS)

# DO NOT DELETE THIS LINE -- make depend depends on it.

#prac.o: mpcio.hpp types.hpp bitutils.hpp corotypes.hpp mpcio.tcc preproc.hpp
#prac.o: options.hpp online.hpp
#mpcio.o: mpcio.hpp types.hpp bitutils.hpp corotypes.hpp mpcio.tcc rdpf.hpp
#mpcio.o: coroutine.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp mpcops.tcc
#mpcio.o: cdpf.hpp cdpf.tcc
#preproc.o: types.hpp bitutils.hpp coroutine.hpp corotypes.hpp mpcio.hpp
#preproc.o: mpcio.tcc preproc.hpp options.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp
#preproc.o: rdpf.tcc mpcops.hpp mpcops.tcc cdpf.hpp cdpf.tcc
#online.o: online.hpp mpcio.hpp types.hpp bitutils.hpp corotypes.hpp mpcio.tcc
#online.o: options.hpp mpcops.hpp coroutine.hpp mpcops.tcc rdpf.hpp dpf.hpp
#online.o: prg.hpp aes.hpp rdpf.tcc duoram.hpp duoram.tcc cdpf.hpp cdpf.tcc
#online.o: cell.hpp heap.hpp shapes.hpp shapes.tcc bst.hpp avl.hpp
#online.o: heapsampler.hpp
#online.o: remise.hpp
#mpcops.o: mpcops.hpp types.hpp bitutils.hpp mpcio.hpp corotypes.hpp mpcio.tcc
#mpcops.o: coroutine.hpp mpcops.tcc
#rdpf.o: rdpf.hpp mpcio.hpp types.hpp bitutils.hpp corotypes.hpp mpcio.tcc
#rdpf.o: coroutine.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp mpcops.tcc
#cdpf.o: bitutils.hpp cdpf.hpp mpcio.hpp types.hpp corotypes.hpp mpcio.tcc
#cdpf.o: coroutine.hpp dpf.hpp prg.hpp aes.hpp cdpf.tcc
#duoram.o: duoram.hpp types.hpp bitutils.hpp mpcio.hpp corotypes.hpp mpcio.tcc
#duoram.o: coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp
#duoram.o: mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc shapes.hpp shapes.tcc
#cell.o: types.hpp bitutils.hpp duoram.hpp mpcio.hpp corotypes.hpp mpcio.tcc
#cell.o: coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp
#cell.o: mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc cell.hpp options.hpp
#bst.o: bst.hpp types.hpp bitutils.hpp duoram.hpp mpcio.hpp corotypes.hpp
#bst.o: mpcio.tcc coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc
#bst.o: mpcops.hpp mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc options.hpp
#avl.o: avl.hpp types.hpp bitutils.hpp duoram.hpp mpcio.hpp corotypes.hpp
#avl.o: mpcio.tcc coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc
#avl.o: mpcops.hpp mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc options.hpp bst.hpp
#heap.o: types.hpp bitutils.hpp duoram.hpp mpcio.hpp corotypes.hpp mpcio.tcc
#heap.o: coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp
#heap.o: mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc cell.hpp options.hpp
#heap.o: shapes.hpp shapes.tcc heap.hpp
annoncomm.o: types.hpp bitutils.hpp duoram.hpp mpcio.hpp corotypes.hpp mpcio.tcc
annoncomm.o: coroutine.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp rdpf.tcc mpcops.hpp
annoncomm.o: mpcops.tcc duoram.tcc cdpf.hpp cdpf.tcc cell.hpp options.hpp
annoncomm.o: shapes.hpp shapes.tcc remise.hpp lowmc/lowmc.h
#heapsampler.o: heapsampler.hpp mpcio.hpp types.hpp bitutils.hpp corotypes.hpp
#heapsampler.o: mpcio.tcc coroutine.hpp heap.hpp options.hpp mpcops.hpp
#heapsampler.o: mpcops.tcc duoram.hpp rdpf.hpp dpf.hpp prg.hpp aes.hpp
#heapsampler.o: rdpf.tcc duoram.tcc cdpf.hpp cdpf.tcc
