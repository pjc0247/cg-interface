class Player
  attr_reader :life
  attr_reader :weapon
  attr_accessor :spell_damage
  attr_reader :field
  attr_reader :deck
  attr_reader :hand
  
  def initialize
    @life = 30
    @weapon = nil
    @spell = nil
    
    @spell_damage = 0
    
    @field = Field.new
    @deck = Deck.new
    @hand = Hand.new
  end
end
