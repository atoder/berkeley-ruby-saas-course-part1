class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    legal_moves = ['R', 'P', 'S']
    p1m = player1[1]
    p2m = player2[1]
    if !(legal_moves.include? p1m) || !(legal_moves.include? p2m)
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    elsif p1m == p2m
      player1
    else
      case p1m
      when 'R'
        p2m == 'P' ? player2 : player1
      when 'P'
        p2m == 'R' ? player1 : player2
      when 'S'
        p2m == 'R' ? player2 : player1
      end 
    end 
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].class == Array
      player1 = self.tournament_winner(tournament[0]) 
    else
      player1 = tournament[0]
    end
    if tournament[1][0].class == Array
      player2 = tournament_winner(tournament[1])
    else
      player2 = tournament[1]
    end
    self.winner(player1, player2)
  end

end
