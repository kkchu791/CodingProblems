@cache_steps = {
    0 => 1,
    1 => 1,
}

def climb_stairs(steps)
    @cache_steps[steps] ||= climb_stairs(steps - 1) + climb_stairs(steps - 2)
end
