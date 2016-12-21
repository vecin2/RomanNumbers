require_relative '../lib/roman_number.rb'

describe RomanNumber do
  it "displays number from one to ten" do
    test(1,'I')
    test(2,'II')
    test(3,'III')
    test(4,'IV')
    test(5,'V')
    test(6,'VI')
    test(7,'VII')
    test(8,'VIII')
    test(9,'IX')
    test(10,'X')
    test(11,'XI')
    test(12,'XII')
    test(13,'XIII')
    test(14,'XIV')
    test(15,'XV')
    test(16,'XVI')
    test(17,'XVII')
    test(18,'XVIII')
    test(19,'XIX')
    test(20,'XX')
    test(21,'XXI')
    test(25,'XXV')
    test(30,'XXX')
    test(40,'XL')
    test(50,'L')
    test(88,'LXXXVIII')
    test(89,'LXXXIX')
    test(99,'XCIX')
    test(100,'C')
    test(90,'XC')
    test(109,'CIX')
    test(138,'CXXXVIII')
    test(140,'CXL')
    test(189,'CLXXXIX')
    test(390,'CCCXC')
    test(390,'CCCXC')
    test(399,'CCCXCIX')
    test(960,'CMLX')
    test(4999,'MMMMCMXCIX')
  end

  def test(arabic, roman)
    romanNumber = RomanNumber.new
    expect(romanNumber.to_roman(arabic)).to eq(roman)
  end

  it "expands the arabic number" do
    romanNumber = RomanNumber.new
    result=[9]
    expect(romanNumber.expand_arabic(9)).to eq(result)
    result=[90,9]
    expect(romanNumber.expand_arabic(99)).to eq(result)
    result=[10,1]
    expect(romanNumber.expand_arabic(11)).to eq(result)
  end

end
