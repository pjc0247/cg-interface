cg-interface
============

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
end
```
```ruby
class Minion < Attackable
  property :taunt?
  property :stealth?
  property :targetable?
  property :poison?
  property :divine?

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

Example
----
```ruby
class HauntedCreeper
  cost :2
  klass :common
  attack :1, life :2
  
  def deathrattle
    2.times do { summon :spectral_spider }
  end
end
```
```ruby
class AnnoyingOTron
  cost :2
  klass :common
  race :mech
  attack :1, life :2
  
  divine :true
  taunt :true
end
```
```ruby
class KeeperOfTheGroove
  cost :4
  klass :druid
  attack :2, life :4
  
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
