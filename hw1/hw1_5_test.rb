#!/usr/bin/env ruby

require "test/unit"
require "hw1_5"


class TestHW1AdvancedOOPMeta < Test::Unit::TestCase

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

  def test_multiple_accessor_history
    so = SomeOtherClass.new
    so.foo = 1
    so.bar = 'three'
    so.foo = :atom
    so.bar = 4
    so.bar = 'ten'

    assert_equal([nil, 1, :atom], so.foo_history)
    assert_equal([nil, 'three', 4, 'ten'], so.bar_history)
  end
end

class TestHW1AdvancedOOPExtend < Test::Unit::TestCase

  def test_currency_convertor
    assert_equal(3.87, 5.dollars.in(:euros))
    assert_equal(3.87, 5.dollar.in(:euro))
    assert_equal(263.1579, 5.dollars.in(:rupee))
    assert_equal(1.3, 100.yen.in(:dollar))
    assert_equal(68.4211, 100.yen.in(:rupees))

    # without .<currency> it should return the same value
    assert_equal(5, 5.in(:dollar))
  end

  def test_string_palindrome
    assert_equal(true, "A man, a plan, a canal -- Panama".palindrome?)
    assert_equal(true, "Madam, I'm Adam!".palindrome?)
    assert_equal(false, "Abracadabra".palindrome?)
  end

  def test_enumerables_palindrome
    assert_equal(true, [1,2,3,2,1].palindrome?)
    assert_equal(true, [3, 1, 3, 1, 3].palindrome?)
    assert_equal(false, [3, 4, 5, 6].palindrome?)
  end


end