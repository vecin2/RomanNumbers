class RomanNumber
  @@arabics#
  def initialize
    @@arabics = {1=>'I', 5=>'V',10=>'X',50=>'L',100=>'C',500=>'D',1000=>'M'}
    @@arabics.default=''
  end

  def to_roman(arabic)
    result =''

    if @@arabics[arabic]!=''
      return @@arabics[arabic]
    end
    expand_arabic(arabic).each { |current_arabic|
      while(current_arabic>0)
        if substraction_notation(current_arabic)!=''
          arabic_to_decrease=current_arabic
          roman_symbol= substraction_notation(current_arabic)
        else
          arabic_to_decrease= get_exact_arabic(current_arabic)
          roman_symbol=@@arabics[arabic_to_decrease]
        end
        result += roman_symbol
        current_arabic = current_arabic - arabic_to_decrease
      end
    }
    return result
  end

  def expand_arabic(arabic)

    expanded_arabic=Array.new

    units =  1
    while (arabic>=units)
      units *= 10
      current_value =arabic%units
      expanded_arabic.unshift(current_value)
      arabic -= current_value
    end
    return expanded_arabic
  end
  def substraction_notation(current_arabic)
    roman_symbol=''
    if @@arabics[current_arabic+1]!=''
      roman_symbol=combine_roman_symbols(1,current_arabic+1)
    elsif @@arabics[current_arabic+10]!=''
      roman_symbol=combine_roman_symbols(10,current_arabic+10)
    elsif @@arabics[current_arabic+100]!=''
      roman_symbol=combine_roman_symbols(100,current_arabic+100)
    end
    return roman_symbol
  end
  def combine_roman_symbols(prefix,exact_arabic) 
    return @@arabics[prefix]+@@arabics[exact_arabic]
  end


  def get_exact_arabic(arabic)
    @@arabics.keys.reverse_each do |key|
      if key <= arabic
        return key
      end

    end
  end
end
