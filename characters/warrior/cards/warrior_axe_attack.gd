extends Card

func apply_effects(_targets:Array[Node]):
	var damage_effect := DamageEffect.new()
	damage_effect.amount = 6
	damage_effect.execute(_targets)
 
