# Enter your code here. Read input from STDIN. Print output to STDOUT

def cycle_length(arg)
    current = arg
    cycles = 1
    while current != 1
        current = cycle_helper(current)
        cycles = cycles + 1
    end
    return cycles
end

def cycle_helper(arg)
    unless (arg % 2 == 0)
        return ((arg * 3) + 1)
    end 
    return (arg / 2 )
end

while STDIN.gets
    STDOUT.write("#{cycle_length($_.to_i)}")
end