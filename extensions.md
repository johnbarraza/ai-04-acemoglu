# Extensions and adversarial checks

All equation and proposition references use the May 5, 2026 PDF stored in `paper/`.

## 1. Recovering the static problem

Let $A$ denote correct prediction of the common state and $B$ correct prediction of the idiosyncratic state. Write

$$
\Delta_G=f(1,0)-f(0,0),\quad
\Delta_I=f(0,1)-f(0,0),\quad
\Delta_X=f(1,1)-f(1,0)-f(0,1)+f(0,0).
$$

Independence of posterior errors gives the general expected production payoff

$$
f(0,0)+G(X)\Delta_G+G(Y)\Delta_I+G(X)G(Y)\Delta_X,
\qquad Y=\sigma^{-2}+\lambda_Ie+\tau_A.
$$

The baseline imposes $\Delta_I=0$ and $\Delta_X>0$. Differentiating its expected utility gives

$$
U_e=\Delta_XG(X)\lambda_Ig(Y)-e^{1/\varepsilon}.
$$

Since $g(Y)>0$, $g'(Y)<0$, the marginal benefit falls with effort while marginal cost rises. The best response is unique; it is interior for $X>0$ and equals zero when $X=0$.

## 2. Observation 1, including the missing domain boundary

For $X>0$ and $Y>0$,

$$
U_{eX}=\Delta_X\lambda_Ig(X)g(Y)>0,
\qquad
U_{e\tau_A}=\Delta_XG(X)\lambda_Ig'(Y)<0.
$$

The paper states the first strict inequality without attaching $X>0$ to Observation 1. That endpoint deserves care. Because

$$
G(X)=2\Phi(\sqrt X)-1,
$$

its right derivative diverges at $X=0$; $g(0)$ is not an ordinary finite real derivative. The economic statement remains clear—moving away from zero public precision raises effort incentives—but the displayed cross-partial is an interior formula, not a conventional derivative at the zero boundary.

## 3. Why agentic precision substitutes

AI precision and private learning precision enter the same sum $Y$. Hence more $\tau_A$ moves the agent down the concave success-probability curve and reduces the marginal payoff to another unit of $e$. This is not a generic theorem about agents. Any technology that adds context-specific precision to $Y$ produces the same static crowd-out. “Agentic” matters only as the paper’s economic interpretation of that signal.

That qualification is substantive: the cross-partial identifies **information substitutability**, not a feature unique to autonomous execution.

## 4. Original production-side extension: $\Delta_I>0$

Retain complementarity $\Delta_X>0$ but allow context-specific knowledge to create standalone value, $\Delta_I>0$. Then

$$
U_e=\lambda_Ig(Y)\{\Delta_I+G(X)\Delta_X\}-e^{1/\varepsilon}.
$$

The two cross-partial signs survive:

$$
U_{eX}=\lambda_Ig(Y)g(X)\Delta_X>0,
$$

$$
U_{e\tau_A}=\lambda_Ig'(Y)\{\Delta_I+G(X)\Delta_X\}<0.
$$

But the dynamics change qualitatively at the boundary. At $X=0$ and $e=0$,

$$
U_e=\lambda_Ig(\sigma^{-2}+\tau_A)\Delta_I>0.
$$

The unique optimum therefore has $e(0,\tau_A)>0$. With $I,\lambda_G>0$,

$$
F(0)=\left[\Sigma^2+(\lambda_G I e(0,\tau_A))^{-1}\right]^{-1}>0.
$$

So $(X,e)=(0,0)$ is not a steady state. This does not prove that all bad dynamics disappear: a low positive steady state, multiplicity, or a sharp decline can remain. It shows that the paper’s exact “all useful human knowledge is destroyed” result is tied to $\Delta_I=0$.

## 5. Propositions 1 and 2

Symmetry gives aggregate effort $E_t=Ie(X_t,\tau_A)$ and the Kalman recursion

$$
X_{t+1}=F(X_t)=\left[\Sigma^2+\{X_t+\lambda_GIe(X_t,\tau_A)\}^{-1}\right]^{-1}.
$$

Because the outer precision update rises with its inner precision, $e$ rises in $X$ and falls in $\tau_A$, $F$ is increasing in $X$ and $I$ and decreasing in $\tau_A$ (strictly away from $X=0$). This establishes the paper’s selected Proposition 2; it does not by itself establish collapse or welfare loss.

## 6. Collapse conditions and an omitted equality case

The local result compares two orders near zero:

$$
e(X,\tau_A)=\Theta(X^{\varepsilon/2}),
\qquad e_{\text{maintenance}}(X)=\Theta(X^2).
$$

- If $\varepsilon<4$, zero is locally unstable and every $X_1>0$ converges to the unique positive steady state.
- If $\varepsilon>4$, zero is locally stable and multiple steady states can arise.
- Proposition 5 adds a complete-collapse threshold $\tau_A^c$: below it there are three steady states; above it zero is globally stable.

The proposition uses strict cases $\tau_A<\tau_A^c$ and $\tau_A>\tau_A^c$ but does not state the equilibrium set at equality. The surrounding tangency discussion suggests coalescing positive fixed points at the threshold, but that endpoint is not part of the proposition as written. It should not be silently folded into either case.

## 7. Is welfare increasing in AI accuracy?

Not unconditionally. At the high-knowledge steady state,

$$
\frac{\partial \bar U^+}{\partial\tau_A}
=\underbrace{g(\bar Y_h)G(\bar X_h)\Delta_X}_{\text{direct gain}}
+\underbrace{\frac{\partial G(\bar X_h)}{\partial\tau_A}
  [\Delta_G+G(\bar Y_h)\Delta_X]}_{\text{dynamic loss}}.
$$

The first term is nonnegative; the second is nonpositive. The single-peaked welfare claim requires Assumption 2, $\sigma^{-2}\ge\sqrt2-1$, plus the relevant steady-state regime. With $\varepsilon>4$, realized welfare also depends on whether the initial state lies above the unstable basin boundary. “More accurate AI improves welfare” is true only locally when the direct term dominates, not as a global unconditional statement.

## 8. What Section 5 relaxes—and what it does not

The authors relax:

1. fixed aggregation capacity, allowing $I(\tau_A)=I_0+\exp(\eta\tau_A)$;
2. exclusively human production of general knowledge, adding synthetic precision $\tau_{syn}$;
3. one-for-one joint production of private and public signals, replacing public input $e$ with $e^\beta$.

They do **not** relax the production restriction $\Delta_I=0$. Synthetic data creates a positive public-knowledge floor through a new signal; the extension above instead changes whether private knowledge has value when public knowledge is absent. These are economically different repairs.

## 9. Lean boundary

The formalization targets algebraic and order-theoretic cores that Lean can check exactly: mixed-partial sign abstractions, monotone transition-map implications, and the $\Delta_I>0$ boundary contradiction. Compilation verifies those formal statements; it does not certify that Gaussian updating, differentiability, or source-to-Lean translation is faithful. EconCSLib’s status and audit files preserve that distinction.

