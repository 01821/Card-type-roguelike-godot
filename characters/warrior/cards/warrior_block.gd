extends Card

func apply_effects(_targets:Array[Node]):
	var block_effect := BlockEffect.new()
	block_effect.amount = 5
	block_effect.execute(_targets)
 
