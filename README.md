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

![ -ku^{''}=0 |:-k ](./svgs/103b355cf26a83699a965368d13be59b.svg)

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


<img src="https://latex.codecogs.com/svg.image?&space;-ku^{''}=0&space;|:-k&space;&space;u^{''}&space;=&space;0&space;&space;\begin{aligned}&space;&&space;v&space;\in&space;u,&space;&&space;u^{''}v=0&space;\end{aligned}&space;$$&space;\int_0^{2}&space;u^{''}v=0&space;&space;\int_0^{2}&space;u^{''}v&space;dx&space;=&space;u^{'}(2)v(2)&space;-&space;u^{'}(0)v(0)&space;-&space;\int_0^{2}u^{'}v^{'}dx&space;=&space;0&space;&space;u^{'}(2)v(2)&space;-&space;u^{'}(0)v(0)&space;=&space;v(0)(20-v(0))&space;&space;(u(0)-20)v(0)&space;-&space;\int_0^{2}u^{'}v^{'}dx&space;=&space;0&space;&space;w(0)v(0)-&space;\int_0^{2}u^{'}v^{'}dx&space;=&space;20v(0)&space;&space;B(w,v)&space;=&space;w(0)v(0)-&space;\int_0^{2}u^{'}v^{'}dx&space;&space;\tau(v)=&space;20v(0)&space;" title=" -ku^{''}=0 |:-k u^{''} = 0 \begin{aligned} & v \in u, & u^{''}v=0 \end{aligned} $$ \int_0^{2} u^{''}v=0 \int_0^{2} u^{''}v dx = u^{'}(2)v(2) - u^{'}(0)v(0) - \int_0^{2}u^{'}v^{'}dx = 0 u^{'}(2)v(2) - u^{'}(0)v(0) = v(0)(20-v(0)) (u(0)-20)v(0) - \int_0^{2}u^{'}v^{'}dx = 0 w(0)v(0)- \int_0^{2}u^{'}v^{'}dx = 20v(0) B(w,v) = w(0)v(0)- \int_0^{2}u^{'}v^{'}dx \tau(v)= 20v(0) " />
