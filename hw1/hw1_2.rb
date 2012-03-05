#!/usr/bin/env ruby

class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError, game.length unless game.length == 2
  # strategies to loose for P1
  strategies = {'P' => 'S', 'S' => 'R', 'R' => 'P'}
  all_strategies = strategies.keys
  player1, player2 = game
  raise NoSuchStrategyError, player1[1] if all_strategies.index(player1[1].upcase) == nil
  raise NoSuchStrategyError, player2[1] if all_strategies.index(player2[1].upcase) == nil
  if strategies[player1[1]] == player2[1]
    return player2
  else
    return player1
  end
end
