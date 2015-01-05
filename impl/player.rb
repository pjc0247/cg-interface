class Player
  def initialize
    @life = 30
    @weapon = nil
    @spell = nil
    
    @field = Field.new
    @deck = Deck.new
    @hand = Hand.new
  end
end
