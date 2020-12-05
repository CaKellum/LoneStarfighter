extends Node2D

signal game_win
signal game_loose

onready var wave :=1

func _on_PlayerShip_game_over()->void:
	emit_signal("game_loose")


func _on_LowEnemyColection_low_enemy_destroyed()->void:
	pass
	
