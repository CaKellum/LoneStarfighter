extends KinematicBody2D

var _velocity := Vector2.ZERO
export var _speed := 100


func _ready()->void:
	$SpaceshipLook.play("safe_ship")


func _get_input()->void:
	var velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		
	_velocity = velocity.normalized() * _speed
	
	if Input.is_action_pressed("fire"):
		_fire_missle()


func _physics_process(_delta:float)->void:
	_get_input()
	_velocity = move_and_slide(_velocity)


func _fire_missle():
	pass
