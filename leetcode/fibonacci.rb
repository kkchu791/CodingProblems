
def fib(n)
  return 0 if n == 0
  return 1 if n < 3

  fib(n - 1) + fib(n - 2)
end
