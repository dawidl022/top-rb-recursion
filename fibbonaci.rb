def fibs(n)
  result = []

  # initialise result to [0, 1], provided that n >= 1
  i = 0
  while i <= 1 && i <= n
    result << i
    i += 1
  end

  (2..n).each do |i|
    result << result[i - 2] + result[i - 1]
  end

  result
end

def fibs_rec(n, result = [])
  return if n < 0

  if n <= 1
    result[n] = n
    fibs_rec(n - 1, result)
    return result
  end

  @memoized ||= {}

  if @memoized[n]
    result[n] = @memoized[n]
    return
  end

  fibs_rec(n - 1, result)
  fibs_rec(n - 2, result)
  result[n] = result[n - 1] + result[n - 2]
  @memoized[n] = result[n]

  result
end
