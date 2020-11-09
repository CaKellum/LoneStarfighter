extends Node2D

signal all_enemy_destroyed


func _on_EnemyArea_low_enemy_defeat()->void:
	if get_child_count() ==0:
		emit_signal("all_enemy_destroyed")
