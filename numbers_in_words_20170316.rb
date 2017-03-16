#Next step:  replace refactor to remove repetitive code

class Fixnum

  def in_words
    return "zero" if self == 0
    return "can't calculate because too large" if self > 999_999_999_999_999
    final_string = String.new

    hundreds_digits = Array.new
    thousands_digits = Array.new
    millions_digits = Array.new
    billions_digits = Array.new
    trillions_digits = Array.new

    num_array = self.to_s.split("")
    num_array.map! { |number| number.to_i }

    1.upto(num_array.length) do |digit_place|

      if digit_place <= 3
        hundreds_digits.unshift(num_array[-1 * digit_place])
      elsif digit_place <= 6
        thousands_digits.unshift(num_array[-1 * digit_place])
      elsif digit_place <= 9
        millions_digits.unshift(num_array[-1 * digit_place])
      elsif digit_place <= 12
        billions_digits.unshift(num_array[-1 * digit_place])
      elsif digit_place <= 15
        trillions_digits.unshift(num_array[-1 * digit_place])
      end

    end

    ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    # magnitudes = ["", "hundred", "thousand", "million", "billion", "trillion", "quadrillion"]


    handle_double_digits = Proc.new do |tens_place, ones_place|
      tens_ones_place = (tens_place * 10) + ones_place
      if (tens_ones_place % 10 == 0) && (tens_ones_place != 0)
        tens[tens_place] + " "
      elsif tens_ones_place > 19
        tens[tens_place] + " " + ones[ones_place] + " "
      elsif tens_ones_place > 9
        teens[(tens_ones_place - 10)] + " "
      elsif tens_ones_place > 0
        ones[tens_ones_place] + " "
      else
        ""
      end
    end


    if trillions_digits.length > 0
      arr = trillions_digits

      if (arr == [0, 0, 0]) || (arr == [0, 0]) || (arr == [0])
        final_string += ""
      elsif (arr.length == 3) && (arr[0] != 0)
        hund_place = arr[0]
        tens_place = arr[1]
        ones_place = arr[2]
        final_string += ones[hund_place] + " hundred "
        final_string += handle_double_digits.call(tens_place, ones_place)
      elsif (arr.length == 2) && (arr[0] != 0)
        tens_place = arr[0]
        ones_place = arr[1]
        final_string += handle_double_digits.call(tens_place, ones_place)
      else
        ones_place = case arr.length
        when 3 then arr[2]
        when 2 then arr[1]
        when 1 then arr[0]
        end
        final_string += ones[ones_place] + " "
      end

      if trillions_digits.max > 0
        final_string += "trillion "
      end
    end

    if billions_digits.length > 0
      arr = billions_digits

      if (arr == [0, 0, 0]) || (arr == [0, 0]) || (arr == [0])
        final_string += ""
      elsif (arr.length == 3) && (arr[0] != 0)
        hund_place = arr[0]
        tens_place = arr[1]
        ones_place = arr[2]
        final_string += ones[hund_place] + " hundred "
        final_string += handle_double_digits.call(tens_place, ones_place)
      elsif (arr.length == 2) && (arr[0] != 0)
        tens_place = arr[0]
        ones_place = arr[1]
        final_string += handle_double_digits.call(tens_place, ones_place)
      else
        ones_place = case arr.length
        when 3 then arr[2]
        when 2 then arr[1]
        when 1 then arr[0]
        end
        final_string += ones[ones_place] + " "
      end

      if billions_digits.max > 0
        final_string += "billion "
      end
    end

    if millions_digits.length > 0
      arr = millions_digits

      if (arr == [0, 0, 0]) || (arr == [0, 0]) || (arr == [0])
        final_string += ""
      elsif (arr.length == 3) && (arr[0] != 0)
        hund_place = arr[0]
        tens_place = arr[1]
        ones_place = arr[2]
        final_string += ones[hund_place] + " hundred "
        final_string += handle_double_digits.call(tens_place, ones_place)
      elsif (arr.length == 2) && (arr[0] != 0)
        tens_place = arr[0]
        ones_place = arr[1]
        final_string += handle_double_digits.call(tens_place, ones_place)
      else
        ones_place = case arr.length
        when 3 then arr[2]
        when 2 then arr[1]
        when 1 then arr[0]
        end
        final_string += ones[ones_place] + " "
      end

      if millions_digits.max > 0
        final_string += "million "
      end
    end

    if thousands_digits.length > 0
      arr = thousands_digits

      if (arr == [0, 0, 0]) || (arr == [0, 0]) || (arr == [0])
        final_string += ""
      elsif (arr.length == 3) && (arr[0] != 0)
        hund_place = arr[0]
        tens_place = arr[1]
        ones_place = arr[2]
        final_string += ones[hund_place] + " hundred "
        final_string += handle_double_digits.call(tens_place, ones_place)
      elsif (arr.length == 2) && (arr[0] != 0)
        tens_place = arr[0]
        ones_place = arr[1]
        final_string += handle_double_digits.call(tens_place, ones_place)
      else
        ones_place = case arr.length
        when 3 then arr[2]
        when 2 then arr[1]
        when 1 then arr[0]
        end
        final_string += ones[ones_place] + " "
      end

      if thousands_digits.max > 0
        final_string += "thousand "
      end
    end


    if hundreds_digits.length > 0
      arr = hundreds_digits

      if (arr == [0, 0, 0]) || (arr == [0, 0]) || (arr == [0])
        final_string += ""
      elsif (arr.length == 3) && (arr[0] != 0)
        hund_place = arr[0]
        tens_place = arr[1]
        ones_place = arr[2]
        final_string += ones[hund_place] + " hundred "
        final_string += handle_double_digits.call(tens_place, ones_place)
      elsif (arr.length == 2) && (arr[0] != 0)
        tens_place = arr[0]
        ones_place = arr[1]
        final_string += handle_double_digits.call(tens_place, ones_place)
      else
        ones_place = case arr.length
        when 3 then arr[2]
        when 2 then arr[1]
        when 1 then arr[0]
        end
        final_string += ones[ones_place] + " "
      end

    end

    final_string.chop
  end #of in_words methods

end #of class


puts 135682983331690.in_words
