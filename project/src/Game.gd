extends Node2D

signal game_win
signal game_loose
signal game_live
signal repopulate

var is_game_live := false

onready var wave_progress := 0
onready var wave :=0
onready var enemy_boss := preload("res://src/EnemyBoss.tscn")

func _process(_delta:float)->void:
	if is_game_live:
		if wave_progress == 3:
			wave +=1
			wave_progress = 0
			$GameIndicator.text = "wave "+str(wave+1)
			$AudioStreamPlayer.play()
			$GameIndicator.show()
			emit_signal("repopulate")
			$WaveDelay.start()
		if wave == 3:
			boss_level()


func boss_level()->void:
	var boss := enemy_boss.instance()
	var _value := boss.connect("destroyed", self,"_on_EnemyBoss_destoryed" )
	boss.position = Vector2(240,-10)
	boss.scale = Vector2(0.75,0.75)
	self.add_child(boss)


func _on_PlayerShip_game_over(amt_fired:float)->void:
	emit_signal("game_loose")
	var points := amt_fired/((wave-3)*(wave_progress-3))
	$GameIndicator.text = "points "+str(int(points))
	$GameIndicator.show()
	is_game_live = false


func _on_LowEnemyColection_low_enemy_destroyed()->void:
	wave_progress +=1


func _on_MedEnemyCollection_med_enemy_destroyed()->void:
	wave_progress +=1


func _on_HardEnemyCollection_hard_enemy_destroyed()->void:
	wave_progress +=1


func _on_WaveDelay_timeout()->void:
	$GameIndicator.hide()
	emit_signal("game_live")
	is_game_live = true


func _on_AudioStreamPlayer2D_finished()->void:
	$AudioStreamPlayer2D.play()


func _on_EnemyBoss_destroyed()->void:
	$AudioStreamPlayer2.play()
	emit_signal("game_win")


func _on_GameScreen_start_game()->void:
	$GameIndicator.show()
	$AudioStreamPlayer2D.play()
	$WaveDelay.start()
