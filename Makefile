install:
	@echo "If something doesnt work please install gfortran/gnuplot"
	gfortran -c ogpf.f90 -o ogpf.o
	gfortran -c lu_f90.f90 -o lu_f90.o
	gfortran -c main.f90 -o main.o
	gfortran -o exec.out main_main.f90 lu_f90.o main.o ogpf.o
	chmod u+x ./exec.out
