extends Node

#卡片事件
signal card_drag_started(card_ui:CardUI)
signal card_drag_ended(card_ui:CardUI)
signal card_aim_started(card_ui:CardUI)
signal card_aim_ended(card_ui:CardUI)
signal card_played(card:Card)#打出卡牌
signal card_tooltip_requested(card:Card)
signal tooltip_hide_requested

# 玩家事件
signal player_hand_drawn
signal player_hand_discarded #弃牌
signal player_turn_ended #点击结束按钮
