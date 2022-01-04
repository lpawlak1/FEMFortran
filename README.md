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

$$
-k(x) \frac{d^2 u(x)}{dx^2} = 0
$$

$$
u(2) = 0
$$

$$
\frac{du(0)}{dx} + u(0) = 20
$$

$$
x \in [0,2]
$$

### Find u(x) in [0,2]

---

$$
-ku^{''}=0 |:-k
$$

$$
u^{''} = 0
$$

$$
\begin{aligned}
& v \in u, & u^{''}v=0
\end{aligned}
$$

$$
\int_0^{2} u^{''}v=0
$$

---

$$
\int_0^{2} u^{''}v dx = u^{'}(2)v(2) - u^{'}(0)v(0) - \int_0^{2}u^{'}v^{'}dx = 0
$$

$$
u^{'}(2)v(2) - u^{'}(0)v(0) = v(0)(20-v(0))
$$

$$
(u(0)-20)v(0) - \int_0^{2}u^{'}v^{'}dx = 0
$$

$$
w(0)v(0)- \int_0^{2}u^{'}v^{'}dx = 20v(0)
$$

---

$$
B(w,v) = w(0)v(0)- \int_0^{2}u^{'}v^{'}dx
$$

$$
\tau(v)= 20v(0)
$$
