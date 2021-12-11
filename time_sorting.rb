require 'benchmark'
require_relative 'merge_sort_efficient'

def gen_random_numbers(n, min, max)
  result = []

  n.times do
    result << rand(min..max)
  end

  result
end

def test_sort(array, sorting_method)
  arrayToSort = array.clone

  time = Benchmark.measure { send(sorting_method, arrayToSort) }

  puts "took #{(time.real * 1000).round(2)} miliseconds"
end

if $PROGRAM_NAME == __FILE__
  array = gen_random_numbers(100, 1, 100)

  require_relative 'merge_sort'
  print "Naive merge sort "
  test_sort(array, :sort)

  require_relative 'merge_sort_efficient'
  print "Optimised merge sort "
  test_sort(array, :sort)
end
