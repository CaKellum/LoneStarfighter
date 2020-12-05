extends KinematicBody2D

signal destroyed

const MIN_X := 0
const MAX_X := 480


var direction := 1
var is_on_path := false
var is_in_area := false
var path_points := []

onready var path_spot := 0.0
onready var start_pos := position

func _ready()->void:
	if get_parent() is Path2D:
		var parent :Path2D= get_parent()
		path_points = parent.curve.get_baked_points()
		is_on_path = true


func _process(delta:float)->void:
	if is_on_path:
		_on_path(delta)
	elif is_in_area:
		_oscillate()
	else:
		_error_oscillation()


func _oscillate()->void:
	position.x +=2*direction
	position.x = clamp(position.x, MIN_X, MAX_X)
	if(position.x == MIN_X):
		direction = 1
	elif position.x == MAX_X:
		direction = -1


func _error_oscillation()->void:
	position.x +=2*direction
	position.x = clamp(position.x,0,480)
	if position.x>start_pos.x+20:
		direction = -1
	if position.x<start_pos.x-20:
		direction = 1

func _on_path(delta:float)->void:
		var target :Vector2= path_points[path_spot]
		if distance(target)<1:
			path_spot +=1
			if path_spot == path_points.size():
				path_spot = 0.0
			path_spot = clamp(path_spot, 0, path_points.size()-1)
			target = path_points[path_spot]
		var velocity := (target - position).normalized()
		var _collison := move_and_collide((velocity*150)*delta)


func hit()-> void:
	emit_signal("destroyed")


func distance(target)->float:
	return sqrt(pow(position.x-target.x,2)+pow(position.y-target.y,2))



func set_position(pos:Vector2)->void:
	position = pos
	

func _on_Appearance_animation_finished()->void:
	self.queue_free()


func _on_EnemyArea_body_entered(body):
	if body == self:
		is_in_area = true
		is_on_path = false
