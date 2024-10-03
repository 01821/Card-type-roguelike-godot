extends Stats
class_name CharacterStats

@export var starting_deck:CardPile#起始牌组
@export var cards_per_turn:int#每回合能抽取多少张卡
@export var max_mana:int

var mana:int:set = set_mana
var deck:CardPile#玩家当前的牌组
var discard:CardPile#弃牌堆
var draw_pile:CardPile#抽牌堆

func set_mana(value:int):
	mana = value
	stats_changed.emit()
	
func reset_mana():
	self.mana = max_mana
	
func can_play_card(card:Card) -> bool:
	return mana >= card.cost

func create_instance() -> Resource:
	var instance:Stats = self.duplicate()
	instance.health = max_health
	instance.block = 0
	instance.reset_mana()
	instance.deck = instance.starting_deck.duplicate()
	instance.draw_pile = CardPile.new()
	instance.discard = CardPile.new()
	return instance
