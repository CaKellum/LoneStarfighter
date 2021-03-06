extends KinematicBody2D

signal destroyed

var rng := RandomNumberGenerator.new()
var is_on_path := false
var is_in_area := false
var can_fire := false
var can_move := false
var velocity := Vector2.ZERO
var amt_fired := 0
var hit_count := 0
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
		if can_move:
			velocity = enemy_move.on_path(path_points,position)
			var _collision := move_and_collide((velocity*100)*delta)
	elif is_in_area:
		position = enemy_move.oscillate(position)
	else:
		position = enemy_move.error_oscillation(position)
	if can_fire and can_move:
		enemy_move.fire(get_parent().get_parent(), 
		$RightMuzzle.global_position)
		enemy_move.fire(get_parent().get_parent(), 
		$LeftMuzzle.global_position)
		can_fire = false


func hit()-> void:
	if hit_count>1:
		can_move = false
		velocity = Vector2.ZERO
		set_collision_layer_bit(0,false)
		set_collision_layer_bit(3,false)
		set_collision_mask_bit(0,false)
		set_collision_mask_bit(3,false)
		$AudioStreamPlayer2D.play()
		emit_signal("destroyed")
	else:
		$Appearance.play("Ship2")
		hit_count+=1


func _on_FireTimer_timeout()->void:
	can_fire = true
	$FireTimer.wait_time = rng.randf_range(1,3)
	$FireTimer.start()


func _on_Game_game_live()->void:
	can_move = true


func _on_AudioStreamPlayer2D_finished()->void:
	self.queue_free()
