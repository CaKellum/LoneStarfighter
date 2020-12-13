extends Node2D

signal game_win
signal game_loose

onready var wave_progress := 0
onready var wave :=0

func _process(_delta:float):
	if wave_progress == 3:
		wave +=1
		wave_progress = 0
		$WaveDelay.start()
	if wave == 3:
		boss_level()


func boss_level()->void:
	pass

func _on_PlayerShip_game_over()->void:
	emit_signal("game_loose")


func _on_LowEnemyColection_low_enemy_destroyed()->void:
	wave_progress +=1


func _on_MedEnemyCollection_med_enemy_destroyed()->void:
	wave_progress +=1


func _on_HardEnemyCollection_hard_enemy_destroyed()->void:
	wave_progress +=1
