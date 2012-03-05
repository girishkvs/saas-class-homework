#!/usr/bin/env ruby

require "test/unit"
require "hw1_2"


class TestHW1Game < Test::Unit::TestCase

  def test_wrong_number_of_players
    assert_raise(WrongNumberOfPlayersError) {
      rps_game_winner([["Armando", "P"], ["Dave", "S"], ["Brook", "R"]])}
    assert_raise(WrongNumberOfPlayersError) {
      rps_game_winner([["Armando", "P"]])}
    assert_nothing_raised(WrongNumberOfPlayersError) {
      rps_game_winner([["Armando", "P"], ["Dave", "S"]])}
  end

  def test_no_such_strategy
    assert_raise(NoSuchStrategyError) {
      rps_game_winner([["Armando", "B"], ["Dave", "S"]])}
    assert_raise(NoSuchStrategyError) {
      rps_game_winner([["Armando", "P"], ["Dave", "N"]])}
    assert_raise(NoSuchStrategyError) {
      rps_game_winner([["Armando", "B"], ["Dave", "N"]])}
    assert_nothing_raised(NoSuchStrategyError) {
      rps_game_winner([["Armando", "p"], ["Dave", "S"]])}
  end

  def test_game
    assert_equal(rps_game_winner([["Armando", "P"], ["Dave", "S"]]),
                 ["Dave", "S"])
    assert_equal(rps_game_winner([["Brook", "R"], ["Dave", "S"]]),
                 ["Brook", "R"])
    assert_equal(rps_game_winner([["Armando", "P"], ["Dave", "R"]]),
                 ["Armando", "P"])
  end

  def test_the_same_strategy
    assert_equal(rps_game_winner([["Armando", "P"], ["Dave", "P"]]),
                 ["Armando", "P"])
    assert_equal(rps_game_winner([["Dave", "P"], ["Armando", "P"]]),
                 ["Dave", "P"])
    assert_equal(rps_game_winner([["Armando", "S"], ["Brook", "s"]]),
                 ["Armando", "S"])
  end

end
