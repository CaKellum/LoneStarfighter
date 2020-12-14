extends Control

signal replay

func _on_Game_game_win()->void:
	$WinLabel.show()


func _on_Game_game_loose():
	$LooseLabel.show()

func _process(_delta:float):
	if(self.is_visible_in_tree()):
		if Input.is_action_just_pressed("ui_accept"):
			emit_signal("replay")
		
