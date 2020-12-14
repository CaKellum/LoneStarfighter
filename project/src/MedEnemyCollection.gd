extends Path2D

signal med_enemy_destroyed

const CHILDREN := 8
const CHILD_SPAWN := [Vector2(-192,64),Vector2(-320,64),Vector2(-480,64),
Vector2(-656,64),Vector2(-880,64),Vector2(-1080,64),Vector2(-1080,64),Vector2(-1080,64)]

var enemy_med := preload("res://src/EnemyMedium.tscn")
var has_emited := false

func _process(_delta:float)->void:
	if get_child_count() == 1 and (not has_emited):
		emit_signal("med_enemy_destroyed")
		has_emited = true


func populate()->void:
	if get_child_count() < CHILDREN:
		var new_enemy := enemy_med.instance()
		new_enemy.position = CHILD_SPAWN[get_child_count()-1]
		new_enemy.can_move = true
		new_enemy.scale = Vector2(.5,.5)
		self.add_child(new_enemy)
		$Timer.start()
	else:
		has_emited = false


func _on_Timer_timeout():
	populate()	


func _on_Game_repopulate():
	populate()
