require 'enumerator'
class RomanNumber
  @@romanSymbols
  @@arabicNumbers
  def initialize
    @@romanSymbols = {'I'=>1, 'V'=>5,'X'=>10,'L'=>50,'C'=>100,'D'=>500,'M'=>1000}
    @@arabicNumbers= {1=>'I', 5=>'V'}
  end
  def toArabic(roman)
    romanCharArray = roman.split(//)
    result=0
    romanCharArray.each_with_index do |value,index|
      if index < romanCharArray.size-1 && @@romanSymbols[value]<@@romanSymbols[romanCharArray[index+1]]
        result-=@@romanSymbols[value]
      else
        result +=@@romanSymbols[value]
      end
  end
    return result
  end

  def toRoman(arabic)
    return @@arabicNumbers[arabic]
  end
end

