require "test/unit"
require "hw1_1"

class TestHW1Strings < Test::Unit::TestCase

  def test_palindrome
    assert_equal(true, palindrome?("A man, a plan, a canal -- Panama"))
    assert_equal(true, palindrome?("Madam, I'm Adam!"))
    assert_equal(false, palindrome?("Abracadabra"))
  end

  def test_count_words
    assert_equal({'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}, count_words("A man, a plan, a canal -- Panama"))
    assert_equal({'doo' => 3, 'bee' => 2}, count_words("Doo bee doo bee doo"))
  end

end

