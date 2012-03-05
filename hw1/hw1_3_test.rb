#!/usr/bin/env ruby

require "test/unit"
require "hw1_3"


class TestHW1Anagram < Test::Unit::TestCase

  def test_basic
    input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    output = [
              ["cars", "racs", "scar"],
              ["for"],
              ["potatoes"],
              ["four"],
              ["creams", "scream"]]
    assert_equal(combine_anagrams(input), output)
  end

end
