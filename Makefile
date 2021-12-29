install:
	@echo "If something doesnt work please install gfortran cli tool"
	gfortran -c main.f90
	gfortran -c ./lu_f90.f90
	gfortran -c ./ogpf.f90
	gfortran -o exec.out main_main.f90 lu_f90.o main.o ogpf.o
	chmod u+x ./exec.out
exec:
	@echo "Launching"
	rm ./plot_data.data
	time ./exec.out
	gnuplot plot.sl
