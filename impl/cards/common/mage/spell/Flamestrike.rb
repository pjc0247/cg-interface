class Flamestrike < Spell
  cost 7
  klass :mage
  
  def invoke
    @opposite.field.each do |minion|
      minion.deal! 4
    end
  end
end
