class RomanNumber
  @@arabics

  def initialize
    @@arabics = {1=>'I', 5=>'V',10=>'X',50=>'L',100=>'C',500=>'D',1000=>'M'}
    @@arabics.default=''
  end


  def to_roman(arabic)
    result =''
    expand_arabic(arabic).each { |current_arabic|
      result += compute_roman(current_arabic)
    }
    return result
  end


  def expand_arabic(arabic)
    expanded_arabic=Array.new
    units =  1
    while (arabic>=units)
      units *= 10
      current_value =arabic%units
      if current_value > 0
        expanded_arabic.unshift(current_value)
      end
      arabic -= current_value
    end
    return expanded_arabic
  end


  def compute_roman(current_arabic)
    if substraction_notation(current_arabic)!=''
      roman_symbol= substraction_notation(current_arabic)
    else
      roman_symbol= addition_notation(current_arabic)
    end
  end


  def substraction_notation(current_arabic)
    return compose_substracted_roman(1,current_arabic) +
      compose_substracted_roman(10,current_arabic) +
      compose_substracted_roman(100,current_arabic)
  end


  def compose_substracted_roman(prefix,exact_arabic) 
    if @@arabics[exact_arabic+prefix]!=''
      return @@arabics[prefix]+@@arabics[exact_arabic+prefix]
    end
    return ''
  end


  def addition_notation(current_arabic)
    roman_symbol=''
    while(current_arabic>0)
      arabic_to_decrease= get_next_arabic(current_arabic)
      roman_symbol+=@@arabics[arabic_to_decrease]
      current_arabic = current_arabic - arabic_to_decrease
    end
    roman_symbol
  end


  def get_next_arabic(arabic)
    @@arabics.keys.reverse_each do |key|
      if key <= arabic
        return key
      end
    end
  end

end
