cg-interface
============

```ruby
class Card
  property :id
  property :cost
end
```
```ruby
class Minion
  property :life, :attack
  
  property :taunt?
  property :stealth?
  property :targetable?
  
  abstract :battlecry
  abstract :deathrattle
  abstract :damaged
  abstract :summoned
end
```
