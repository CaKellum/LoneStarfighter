extends KinematicBody2D

signal game_over

const RIGHT_MUZZEL = Vector2(15,13)
const LEFT_MUZZEL = Vector2(-15,13)

var _velocity := Vector2.ZERO
var amt_fired_missiles := 0

export var _speed := 100

onready var player_health := HealthManager.new(3)

func _ready()->void:
	$SpaceshipLook.play("safe_ship")


func _get_input()->void:
	var velocity := Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	
	_velocity = velocity.normalized() * _speed
	position.x = clamp(position.x, 0, 480)
	
	if Input.is_action_pressed("fire"):
		_fire_missle()


func _fire_missle():
	var muzzel := Vector2()
	var shot := Missile.new()
	amt_fired_missiles +=1
	if amt_fired_missiles%2 == 0:
		muzzel = RIGHT_MUZZEL
	else:
		muzzel = LEFT_MUZZEL
	shot.fired(muzzel)


func hit()->void:
	$SpaceshipLook.play("exploded")
	self.queue_free()
	if !player_health.has_lives():
		emit_signal("game_over")
	else:
		player_health.loose_life()


func _physics_process(_delta:float)->void:
	_get_input()
	_velocity = move_and_slide(_velocity)
