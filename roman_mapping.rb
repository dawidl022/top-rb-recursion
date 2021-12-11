INTEGER_TO_ROMAN = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

ROMAN_TO_INTEGER = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def to_roman(integer)
  return INTEGER_TO_ROMAN[integer] if INTEGER_TO_ROMAN[integer]

  INTEGER_TO_ROMAN.each do |value, numeral|
    return numeral + to_roman(integer - value) if integer >= value
  end
end

puts to_roman(99)

def to_integer(numeral)
  return ROMAN_TO_INTEGER.fetch(numeral, 0) if numeral.length <= 1

  result = ROMAN_TO_INTEGER[numeral[0, 2]]

  if result
    offset = 2
  else
    result = ROMAN_TO_INTEGER[numeral[0]]
    offset = 1
  end

  result + to_integer(numeral[offset..])
end


puts to_integer("XCIX")
