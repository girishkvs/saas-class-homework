#!/usr/bin/env ruby

require "test/unit"
require "hw1_4"


class TestHW1BasicOOP < Test::Unit::TestCase

  def test_dessert
    assert_nothing_raised(StandardError) {Dessert.new('Cheese cake', 500)}

    cheese_cake = Dessert.new('Cheese cake', 500)
    assert_equal(cheese_cake.name, 'Cheese cake')
    assert_equal(cheese_cake.calories, 500)
    assert_equal(cheese_cake.healthy?, false)
    assert_equal(cheese_cake.delicious?, true)

    apple = Dessert.new('Apple', 120)
    assert_equal(apple.name, 'Apple')
    assert_equal(apple.calories, 120)
    assert_equal(apple.healthy?, true)
    assert_equal(apple.delicious?, true)
  end

  def test_jelly_bean
    assert_nothing_raised(StandardError) {JellyBean.new('Jelly Bean', 500, 'orange')}

    jelly_bean = JellyBean.new('Jelly Bean', 220, 'orange')
    assert_equal(jelly_bean.name, 'Jelly Bean')
    assert_equal(jelly_bean.calories, 220)
    assert_equal(jelly_bean.flavor, 'orange')
    assert_equal(jelly_bean.healthy?, false)
    assert_equal(jelly_bean.delicious?, true)

    jelly_bean_bl = JellyBean.new('Jelly Bean', 190, 'black licorice')
    assert_equal(jelly_bean_bl.name, 'Jelly Bean')
    assert_equal(jelly_bean_bl.calories, 190)
    assert_equal(jelly_bean_bl.flavor, 'black licorice')
    assert_equal(jelly_bean_bl.healthy?, true)
    assert_equal(jelly_bean_bl.delicious?, false)

    # apple should work as before
    apple = Dessert.new('Apple', 120)
    assert_equal(apple.name, 'Apple')
    assert_equal(apple.calories, 120)
    assert_equal(apple.healthy?, true)
    assert_equal(apple.delicious?, true)
  end

end
