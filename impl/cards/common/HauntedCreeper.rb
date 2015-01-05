class HauntedCreeper < Minion
  cost 2
  klass :common
  attack 1, life 2

  def deathrattle
    2.times do { @owner.field.summon! :spectral_spider }
  end
end
