#!/usr/bin/env ruby

require "test/unit"
require "hw1_6"


class TestHW1Iterators < Test::Unit::TestCase

  def test_cartesian
    c = CartesianProduct.new([:a,:b], [4,5])
    assert_equal([[:a, 4], [:a, 5], [:b, 4], [:b, 5]], c.to_a)
  end

  def test_cartesian_empty
    c = CartesianProduct.new([:a,:b], [])
    assert_equal([], c.to_a)
  end

end