extends Path2D

signal hard_enemy_destroyed

const CHILDREN := 4
const CHILD_SPAWN := [Vector2(0,0),Vector2(-880,-100),Vector2(-688,-64)]

var enemy_hard := preload("res://src/EnemyHard.tscn")
var has_emited := false

func _process(_delta:float)->void:
	if get_child_count() == 1 and (not has_emited):
		emit_signal("hard_enemy_destroyed")
		has_emited = true


func populate()->void:
	if get_child_count() < CHILDREN:
		var new_enemy := enemy_hard.instance()
		new_enemy.position = CHILD_SPAWN[get_child_count()-1]
		new_enemy.can_move = true
		self.add_child(new_enemy)
		$Timer.start()
	else:
		has_emited = false


func _on_Timer_timeout()->void:
	populate()	


func _on_Game_repopulate()->void:
	populate()
