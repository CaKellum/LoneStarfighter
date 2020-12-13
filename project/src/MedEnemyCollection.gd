extends Path2D

signal med_enemy_destroyed

func _process(_delta:float)->void:
	if get_child_count() == 0:
		emit_signal("med_enemy_destroyed")


func _on_WaveDelay_timeout():
	pass # Replace with function body.
