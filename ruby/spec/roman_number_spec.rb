require_relative '../lib/roman_number.rb'

describe RomanNumber do
  @tests ={
    1=>'I',2=>'II', 3=>'III', 4=>'IV', 5=>'V',
    6=>'VI', 7=>'VII', 8=>'VIII', 9=>'IX', 10=>'X',
    11=>'XI', 12=>'XII', 13=>'XIII', 14=>'XIV', 15=>'XV',
    16=>'XVI', 17=>'XVII', 18=>'XVIII', 19=>'XIX', 20=>'XX',
    21=>'XXI', 25=>'XXV', 30=>'XXX', 40=>'XL', 50=>'L',
    88=>'LXXXVIII', 89=>'LXXXIX', 99=>'XCIX', 100=>'C',
    90=>'XC', 109=>'CIX', 138=>'CXXXVIII', 140=>'CXL', 189=>'CLXXXIX',
    390=>'CCCXC', 399=>'CCCXCIX', 960=>'CMLX',
    4999=>'MMMMCMXCIX'
  }
  @tests.each do |arabic, roman|
    it "From arabic '"+arabic.to_s+"' returns roman '"+roman+"'" do
      test(arabic, roman)
    end
  end

  def test(arabic, roman)
    romanNumber = RomanNumber.new
    expect(romanNumber.to_roman(arabic)).to eq(roman)
  end
end
