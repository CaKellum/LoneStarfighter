extends Node2D

signal game_win
signal game_loose
signal new_wave

var is_game_live := false

onready var wave_progress := 0
onready var wave :=0
onready var enemy_boss := preload("res://src/EnemyBoss.tscn")

func _ready()->void:
	$GameIndicator.show()
	

func _process(_delta:float)->void:
	if is_game_live:
		if wave_progress == 3:
			wave +=1
			wave_progress = 0
			$WaveDelay.start()
		if wave == 3:
			boss_level()


func boss_level()->void:
	self.add_child(enemy_boss.new())

func _on_PlayerShip_game_over()->void:
	emit_signal("game_loose")
	is_game_live = false


func _on_LowEnemyColection_low_enemy_destroyed()->void:
	wave_progress +=1


func _on_MedEnemyCollection_med_enemy_destroyed()->void:
	wave_progress +=1


func _on_HardEnemyCollection_hard_enemy_destroyed()->void:
	wave_progress +=1


func _on_WaveDelay_timeout():
	$GameIndicator.hide()
	is_game_live = true
