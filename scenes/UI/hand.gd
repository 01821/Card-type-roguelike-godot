extends HBoxContainer
class_name Hand

var cards_played_this_turn: = 0
@export var char_stats:CharacterStats
const CARD_UI_SCENE = preload("res://scenes/card_ui/card_ui.tscn")

func _ready():
	Events.card_played.connect(_on_card_played)
	
func add_card(card:Card):
	var new_card_ui := CARD_UI_SCENE.instantiate()
	add_child(new_card_ui)
	new_card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)
	new_card_ui.card = card
	new_card_ui.parent = self
	new_card_ui.char_stats = char_stats

func discard_card(card:CardUI):
	card.queue_free()

func disable_hand():
	for card in get_children():
		card.disabled = true

func _on_card_played(_card:Card):
	cards_played_this_turn += 1

func _on_card_ui_reparent_requested(child:CardUI):
	child.reparent(self)
	var new_index := clampi(child.original_index - cards_played_this_turn ,0,get_child_count())
	move_child.call_deferred(child , new_index)
