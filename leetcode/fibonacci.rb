@fib_numbers = {
    0 => 0,
    1 => 1,
    2 => 1,
}

def fib(n)
    @fib_numbers[n] ||= fib(n - 1) + fib(n - 2)
end
