extends Control

signal start_game

func _on_Button_pressed():
	self.hide()
	emit_signal("start_game")
