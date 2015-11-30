require 'test/unit'
require_relative 'roman_number'
class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_toArabic
    a('I', 1)
    a('III', 3)
    a('IV', 4)
    a('V', 5)
    a('VI', 6)
    a('IX', 9)
    a('X', 10)
    a('XI', 11)
    a('XIX', 19)
    a('XXXIX', 39)
    a('XL', 40)
    a('L', 50)
    a('XC', 90)
    a('D', 500)
    a('CIC', 199)
    a('M', 1000)
    a('MCMLXXXIV', 1984)
    a('MMMDCCCLXXXVIII', 3888)
  end

  def test_toRoman
    r(1,'I')
    r(5, 'V')
    r(10,'X')
  end

  def a(roman, arabic)
    romanNumber = RomanNumber.new
    assert_equal(arabic, romanNumber.toArabic(roman))
  end

  def r(arabic, roman)
    romanNumber = RomanNumber.new
    assert_equal(roman, romanNumber.toRoman(arabic))
  end
end