# Heat equation project using FEM

## Requirements

- gnuplot
- gfortran

## Installation

```bash
make
```

## Executing

```bash
./exec.out
./exec.out n
```

,where `n` stands for amount of elements

## Problem

![ -ku^{''}=0 |:-k ](./svgs/1.svg)

![u(2) = 0](./svgs/2.svg)

![\frac{du(0)}{dx} + u(0) = 20](./svgs/3.svg)

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
