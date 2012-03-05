#!/usr/bin/env ruby

require "test/unit"
require "hw1_5"


class TestHW1AdvancedOOP < Test::Unit::TestCase

  def test_accessor_history
    f = Foo.new
    f.bar = 3
    f.bar = :wowzo
    f.bar = 'boo!'
    assert_equal([nil, 3, :wowzo, 'boo!'], f.bar_history)
  end

  def test_accessor_history_instance
    f = Foo.new
    f.bar = 1
    f.bar = 2
    assert_equal([nil, 1, 2], f.bar_history)
    f = Foo.new
    f.bar = 4
    assert_equal([nil, 4], f.bar_history)
  end

end
