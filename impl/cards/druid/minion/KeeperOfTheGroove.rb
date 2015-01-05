class KeeperOfTheGroove < Minion
  cost 4
  klass :druid
  attack 2, life 4

  def battlecry
    choose :option, [:deal_2_damage, :slience] do |chosen|
      if chosen == :deal_2_damage
        choose :character {|character| character.deal! 2}
      elsif chosen == :slience
        choose :minion {|minion| minion.slience!}
      end
    end
  end
end
