extends Node

signal repopulating

const LOW_ENEMY := preload("res://src/EnemyLow.tscn")

func _process(_delta:float)->void:
	if get_child_count() == 0:
		repopulate()


func _on_Enemy_low_destroyed()->void:
	if get_child_count() == 0:
		emit_signal("repopulating")
		


func repopulate()->void:
	for i in range(5):
		var enemy := LOW_ENEMY.instance()
		enemy.set_position(Vector2(50+(90*i),100))
		add_child(enemy)


func _on_RepopulateDelay_timeout():
	repopulate()
