extends KinematicBody2D

signal destroyed
signal in_stage

var is_on_path := false
var is_in_area := false
var path_points := []

onready var start_pos := position
onready var enemy_move := EnemyMovement.new(start_pos)

func _ready()->void:
	if get_parent() is Path2D:
		var parent :Path2D= get_parent()
		path_points = parent.curve.get_baked_points()
		is_on_path = true


func _process(delta:float)->void:
	if is_on_path:
		var velocity := enemy_move.on_path(path_points,position)
		var _collison := move_and_collide((velocity*100)*delta)
	elif is_in_area:
		position = enemy_move.oscillate(position)
	else:
		position = enemy_move.error_oscillation(position)


func hit()-> void:
	emit_signal("destroyed")


func _on_Appearance_animation_finished()->void:
	self.queue_free()


func _on_EnemyArea_body_entered(body)->void:
	if body == self:
		is_in_area = true
		is_on_path = false
		emit_signal("in_stage")


func _on_HoverTimer_timeout():
	is_in_area = false
	is_on_path = true
