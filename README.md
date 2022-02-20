# Heat equation project using FEM

## Requirements

- gnuplot
- gfortran
- linux/mac, no windows port at the moment

## Installation

```bash
make install
```

## Executing

```bash
./exec.sh
./exec.sh n
```

,where `n` stands for amount of elements

## Cleaning

```bash
make clean
```

or just delete build folder

## Solution

So the solution looks simple:

![](./svgs/ss_2.png)

## Why Fortran

For this task I could use probably every language except Octave and Matlab. So why Fortran you might have asked?

Well I also did it in Python3 with NumPy
And here are the times of executions.

![times.png](./svgs/ss_1.png)

## Problem

![ -ku^{''}=0 |:-k ](./svgs/1.svg)

![u(2) = 0](./svgs/2.svg)

![\frac{du(0)}{dx} + u(0) = 20](./svgs/3.svg)

![k_func](./svgs/k_fun.svg)

![x \in [0,2]](./svgs/4.svg)

### Find u(x) in [0,2]

---

![-ku^{''}=0 |:-k](./svgs/5.svg)

![u^{''} = 0](./svgs/6.svg)

![ v \in u, u^{''}v=0](./svgs/7.svg)

![\int_0^{2} u^{''}v=0](./svgs/8.svg)

---

![\int_0^{2} u^{''}v dx = u^{'}(2)v(2) - u^{'}(0)v(0) - \int_0^{2}u^{'}v^{'}dx = 0](./svgs/9.svg)

![u^{'}(2)v(2) - u^{'}(0)v(0) = v(0)(20-v(0))](./svgs/10.svg)

![(u(0)-20)v(0) - \int_0^{2}u^{'}v^{'}dx = 0](./svgs/11.svg)

![w(0)v(0)- \int_0^{2}u^{'}v^{'}dx = 20v(0)](./svgs/12.svg)

---

![B(w,v) = w(0)v(0)- \int_0^{2}u^{'}v^{'}dx](./svgs/13.svg)

![\tau(v)= 20v(0)](./svgs/14.svg)

## Code used

During making this project I used:

- ogpf - [Object Based Interface to GnuPlot from Fortran](https://github.com/kookma/ogpf)
- LU decomposition routines (and solver), [F90 version by J-P Moreau, Paris](http://jean-pierre.moreau.pagesperso-orange.fr/Fortran/lu_f90.txt), changed a little to suite bigger max n in LU decomposition
