extends KinematicBody2D

signal destroyed


var can_fire := false
var can_move := false
var hit_count := 0

onready var start_pos := position
onready var enemy_move := EnemyMovement.new(start_pos)

func _process(_delta:float)->void:
	if can_fire:
		enemy_move.fire(get_parent(), $RightMuzzle.global_position)
		enemy_move.fire(get_parent(), $LeftMuzzle.global_position)
		can_fire = false


func hit()-> void:
	if hit_count > 2:
		set_collision_layer_bit(0,false)
		set_collision_layer_bit(4,false)
		set_collision_mask_bit(0,false)
		set_collision_mask_bit(4,false)
		emit_signal("destroyed")
	else:
		hit_count += 1
	if hit_count == 1:
		$Appearance.play("ship2")
	if hit_count == 2:
		$Appearance.play("ship3")


func _on_FireTimer_timeout():
	can_fire = true
	$FireTimer.wait_time = 1.5
	$FireTimer.start()


func _on_AudioStreamPlayer2D_finished():
	self.queue_free()
