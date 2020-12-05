extends Node
class_name EnemyMovement

const MIN_X := 0
const MAX_X := 480

var path_spot := 0.0
var direction := 1
var start_pos := Vector2.ZERO

func _init(start_position:Vector2):
	start_pos = start_position


func on_path(path_points:Array, pos:Vector2)->Vector2:
	var target :Vector2= path_points[path_spot]
	if _distance(target, pos)<1:
		path_spot +=1
		if path_spot == path_points.size():
			path_spot = 0.0
		path_spot = clamp(path_spot, 0, path_points.size()-1)
		target = path_points[path_spot]
	return (target - pos).normalized();
	

func oscillate(pos:Vector2)->Vector2:
	pos.x +=2*direction
	pos.x = clamp(pos.x, MIN_X, MAX_X)
	if pos.x == MIN_X:
		direction = 1
	elif pos.x == MAX_X:
		direction = -1
	return pos


func error_oscillation(pos:Vector2)->Vector2:
	pos.x +=2*direction
	pos.x = clamp(pos.x,MIN_X,MAX_X)
	if pos.x>start_pos.x+20:
		direction = -1
	if pos.x<start_pos.x-20:
		direction = 1
	return pos


func _distance(target:Vector2,pos:Vector2)->float:
	return sqrt(pow(pos.x-target.x,2)+pow(pos.y-target.y,2))
