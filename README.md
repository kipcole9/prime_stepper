# Prime Stepper
Coding fun, nothing to see here.

In testing difference ways to check primality the following is observed.

```
iex> Prime.Bench.run
Name                                ips        average  deviation         median         99th %
wikipedia                        6.90 K       0.145 ms    ±17.16%       0.137 ms        0.26 ms
brute force below sqrt(n)        3.97 K        0.25 ms    ±47.08%        0.22 ms        0.51 ms
code wars                        0.89 K        1.13 ms    ±21.40%        1.02 ms        2.04 ms
brute force                      0.42 K        2.39 ms    ±14.91%        2.24 ms        4.09 ms

Comparison:
wikipedia                        6.90 K
brute force below sqrt(n)        3.97 K - 1.74x slower
code wars                        0.89 K - 7.80x slower
brute force                      0.42 K - 16.51x slower
```

Use:

* `Prime.generate(range)` to generate prime numbers
* `Prime.compare(range, step)` to return a tuple list of primes that are `step` difference from each other

