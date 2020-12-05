extends Path2D

signal low_enemy_destroyed

func _process(_delta:float)->void:
	if get_child_count() == 0:
		emit_signal("low_enemy_destroyed")
