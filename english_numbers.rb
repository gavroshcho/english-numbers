class EnglishNumber
  TEENS = { 11 => "eleven", 12 => "twelve", 13 => "thirdteen", 14 => "fourteen", 15 => "fifteen",
            16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen" }.freeze

  TENS = { 1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 
           6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }.freeze

  SINGLE = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 
             6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }.freeze
  attr_accessor :number

  def initialize(number)
    @number = parse_number(number)  
  end

  def in_english
    return nil if number > 99 || number < -99

    if positive?
      positive_number_in_english
    else
      negative_number_in_english 
    end
  end

  private 

  def positive?
    number > 0
  end

  def positive_number_in_english
    if number.between?(11, 19)
      TEENS[number] 
    elsif number % 10 == 0
      TENS[number/10]
    elsif number.between?(21, 99)
      "#{TENS[number/10]}-#{SINGLE[number%10]}"
    else
      SINGLE[number]
    end
  end

  def negative_number_in_english
    abs_number = number.abs
    if abs_number.between?(11, 19)
      "minus #{TEENS[abs_number]}"
    elsif abs_number % 10 == 0
      "minus #{TENS[abs_number/10]}"
    elsif abs_number.between?(21, 99)
      "minus #{TENS[abs_number/10]}-#{SINGLE[abs_number%10]}"
    else
      "minus #{SINGLE[abs_number]}"
    end
  end

  def parse_number(number)
    if number > 0
      number.floor
    else
      float?(number)
    end
  end

  def float?(number)
    if number.is_a? Float
      number.floor + 1
    else
      number
    end
  end
end
