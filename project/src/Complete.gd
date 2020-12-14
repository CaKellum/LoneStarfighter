extends Node2D

func _on_Game_game_loose():
	$EndScreen.show()
	$EndScreen/LooseLabel.show()
	$EndScreen/WinLabel.hide()
	


func _on_Game_game_win():
	$EndScreen.show()
	$EndScreen/WinLabel.show()
	$EndScreen/LooseLabel.hide()


func _on_GameScreen_start_game():
	$AudioStreamPlayer2D.stop()


func _on_EndScreen_replay():
	var _value:= get_tree().reload_current_scene()
