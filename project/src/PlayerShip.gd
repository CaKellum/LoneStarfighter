extends KinematicBody2D

signal game_over

const MISSILE := preload("res://src/PlayerMissile.tscn")
const HEALTHMANAGER := preload("res://src/PlayerHealth.gd")

var _velocity := Vector2.ZERO
var amt_fired_missiles := 0
var is_fatigued := false

export var _speed := 100

func _ready()->void:
	$SpaceshipLook.play("safe_ship")
	print(self.get_instance_id())


func _get_input()->void:
	var velocity := Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	
	_velocity = velocity.normalized() * _speed
	position.x = clamp(position.x, 0, 480)
	position.y = clamp(position.y, 620,630)
	
	if Input.is_action_pressed("fire") and not is_fatigued:
		_fire_missle()
		$CannonCoolDown.start()
		is_fatigued = true


func _fire_missle()->void:
	var shot := MISSILE.instance()
	get_parent().add_child(shot)
	amt_fired_missiles +=1
	if amt_fired_missiles%2 == 0:
		shot.fired($RightMuzzle.global_position)
	else:
		shot.fired($LeftMuzzle.global_position)


func hit()->void:
	$SpaceshipLook.play("exploded")
	if !$SpaceshipLook.is_playing():
		emit_signal("game_over")
		queue_free()


func _physics_process(_delta:float)->void:
	_get_input()
	_velocity = move_and_slide(_velocity)


func _on_CannonCoolDown_timeout()->void:
	is_fatigued = false
