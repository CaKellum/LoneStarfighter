extends KinematicBody2D

signal game_over

const MISSILE := preload("res://src/PlayerMissile.tscn")
const HEALTHMANAGER := preload("res://src/PlayerHealth.gd")

var _velocity := Vector2.ZERO
var amt_fired_missiles := 0
var is_fatigued := false
var can_move := true

export var _speed := 100

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
	set_collision_layer_bit(0,false)
	set_collision_mask_bit(0,false)
	can_move = false
	_velocity = Vector2.ZERO
	$SpaceshipLook.play("exploded")
	emit_signal("game_over")
	self.queue_free()


func _physics_process(delta:float)->void:
	if can_move:
		_get_input()
	var collision := move_and_collide(_velocity*delta)
	if collision:
		print(collision.collider)
		if collision.collider.get_collision_layer_bit(1):
			self.hit()

func _on_CannonCoolDown_timeout()->void:
	is_fatigued = false
