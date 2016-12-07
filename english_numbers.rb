class EnglishNumber
  TEENS = { 11 => "eleven", 12 => "twelve", 13 => "thirdteen", 14 => "fourteen", 15 => "fifteen",
            16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen" }.freeze

  TENS = { 0 => "zero", 1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 
           6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }.freeze

  SINGLE = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 
             6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }.freeze
  attr_accessor :number

  def initialize(number)
    @number = remove_decimal_point(number)  
  end

  def in_english
    return nil if number > 99 || number < -99

    numbers_in_english 
  end

  private 

  def numbers_in_english
    abs_number = number.abs
    if abs_number.between?(11, 19)
      "#{prepend_minus(number)} #{TEENS[abs_number]}".strip
    elsif abs_number % 10 == 0
      "#{prepend_minus(number)} #{TENS[abs_number/10]}".strip
    elsif abs_number.between?(21, 99)
      "#{prepend_minus(number)} #{TENS[abs_number/10]}-#{SINGLE[abs_number%10]}".strip
    else
      "#{prepend_minus(number)} #{SINGLE[abs_number]}".strip
    end
  end

  def remove_decimal_point(number)
    number.abs.floor * sign(number)
  end

  def sign(number)
    if number >= 0
      1
    else
      -1
    end
  end

  def prepend_minus(number)
    if sign(number) == 1
      ""
    else
      "minus"
    end
  end
end
