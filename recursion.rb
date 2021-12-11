def factorial(n)
  return 1 if n <= 1
  n * factorial(n - 1)
end

def palindrome(string)
  return true if string.length <= 1
  string[0] == string[-1] && palindrome(string[1...-1])
end

def bottles_on_wall(n)
  if n <= 0
    puts "No more bottles of beer on the wall"
    return
  end

  if n == 1
    puts "#{n} bottle of beer on the wall"
  else
    puts "#{n} bottles of beer on the wall"
  end
  bottles_on_wall(n - 1)
end

def fib(n)
  return 0 if n <= 0
  return 1 if n == 1

  @memoized ||= {}
  @memoized[n] ||= fib(n-1) + fib(n - 2)
end

def flatten(array)
  return [array] unless array.is_a?(Array)

  array.reduce([]) do |result, item|
    result + flatten(item)
  end
end

puts factorial(4)
puts palindrome("amanaplanacanalpanama")

bottles_on_wall(5)

puts fib(100);

p flatten([[1, 2], [3, 4]])
p flatten([[1, [8, 9]], [3, 4]])
p flatten([[[1], [2]], [[3], [4]]])
