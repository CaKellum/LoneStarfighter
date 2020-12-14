extends Path2D

signal low_enemy_destroyed

const CHILDREN := 7
const CHILD_SPAWN := [Vector2(-192,704),Vector2(-320,704),Vector2(-480,704),
Vector2(-656,704),Vector2(-880,704),Vector2(-1080,704)]

var enemy_low := preload("res://src/EnemyLow.tscn")
var has_emited := false

func _process(_delta:float)->void:
	if get_child_count() == 1 and (not has_emited):
		emit_signal("low_enemy_destroyed")
		has_emited = true


func populate()->void:
	if get_child_count() < CHILDREN:
		var new_enemy := enemy_low.instance()
		new_enemy.position = CHILD_SPAWN[get_child_count()-1]
		new_enemy.can_move = true
		new_enemy.scale = Vector2(.5,.5)
		self.add_child(new_enemy)
		$Timer.start()
	else:
		has_emited = false


func _on_Timer_timeout()->void:
	populate()	


func _on_Game_repopulate()->void:
	populate()
