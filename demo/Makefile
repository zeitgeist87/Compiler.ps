PSC     = sh ../compile.sh
CC      = gcc

all: nqueens

nqueens: main.s func.s
	$(CC) -o nqueens main.s func.s

main.s func.s: nqueens.ps
	$(PSC) nqueens.ps

clean:
	rm nqueens *.s -f
