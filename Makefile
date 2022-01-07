install:
	@echo "If something doesnt work please install gfortran/gnuplot"
	mkdir -p build
	gfortran -c ogpf.f90 -o build/ogpf.o
	gfortran -c lu_f90.f90 -o build/lu_f90.o
	gfortran -c utilities.f90 -o build/utilities.o
	gfortran -o build/exec.out FEM1DHeat.f90 build/lu_f90.o build/utilities.o build/ogpf.o
	rm *.mod
	chmod u+x ./build/exec.out
clean:
	@echo "deleting all compiled files"
	rm -rf build/
