class RandGen
  def initialize
    @r = Random.new
  end
  
  def character player, n=1
    if player == :both
    else
    end
  end
  def minion player, n=1
    if player == :both
    else
      return player.field.sample n
    end
  end
  def hand player, n=1
    if player == :both
    else
      return player.hand.sample n
    end
  end
end
