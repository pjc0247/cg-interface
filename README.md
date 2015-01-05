hs-interface
============

```ruby
class Player
  property :id
  
  property :life
  property :weapon
  property :spell
  
  property :spell_damage
  
  property :field
  property :deck
  property :hand
end
```
```ruby
class Field < Array
  def summon minion
  end
end
```
```ruby
class Card
  property :id
  property :klass
  property :race
  
  property :cost
  
  property :owner
end
```
```ruby
class Attackable < Card
  property :life, :attack
  
  abstract :battlecry
  abstract :deathrattle
  abstract :attack
end
```
```ruby
class Weapon < Attackable
  # property :life, :attack
  
  # abstract :battlecry
  # abstract :deathrattle
  # abstract :attack
end
```
```ruby
class Minion < Attackable
  # property :life, :attack
  
  property :taunt?
  property :stealth?
  property :targetable?
  property :poison?
  property :divine?

  # abstract :battlecry
  # abstract :deathrattle
  # abstract :attack
  
  abstract :damaged
  abstract :summoned_other
  abstract :turn_started
  abstract :turn_ended
end
```
```ruby
class Spell < Card
  property :secret?
  
  abstract :invoked
  
  abstract :summoned
  abstract :dead
  abstract :attack
  abstract :damaged
  abstract :spell
end
```

Methods
----
* __choose__(type, args)
  * type
    * :option
    * :character
    * :minion
* __deal!__(damage)
* __slience!__

Example
----
```ruby
class HauntedCreeper < Minion
  cost 2
  klass :common
  attack 1, life 2
  
  def deathrattle
    2.times do { @owner.field.summon! :spectral_spider }
  end
end
```
```ruby
class AnnoyingOTron < Minion
  cost 2
  klass :common
  race :mech
  attack 1, life 2
  
  divine :true
  taunt :true
end
```
```ruby
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
```
```ruby
class WhirlingBlades < Spell
  cost 1
  
  def invoke
    choose :minion {|minion| minion.attack += 1}
  end
end
```
```ruby
class FrostwolfWarlord < Minion
  cost 5
  attack 4, life 4
  
  def battlecry
    attack += @owner.field.count
    life += @owner.field.count
  end
end
```
