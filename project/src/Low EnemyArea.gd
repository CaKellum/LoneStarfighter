extends Node

signal low_enemy_defeat

func _on_Enemy_low_destroyed()->void:
	if get_child_count() == 0:
		emit_signal("low_enemy_defeat")
		queue_free()
