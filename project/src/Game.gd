extends Node2D

signal game_win
signal game_loose


func _on_EnemyArea_all_enemy_destroyed()->void:
	emit_signal("game_win")



func _on_PlayerShip_game_over():
	emit_signal("game_loose")
