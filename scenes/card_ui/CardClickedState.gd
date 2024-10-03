extends CardState

func enter():
	card_ui.drop_point_detector.monitoring = true

func on_input(_event:InputEvent):
	if _event is InputEventMouseMotion:
		transition_requested.emit(self,CardState.State.DRAGGING)
