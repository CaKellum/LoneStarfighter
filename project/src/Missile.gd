class_name Missile
extends KinematicBody2D


const SPEED := 1
var _velocity :=  Vector2()

func fired(pos:Vector2)->void:
	self.position = pos
	_velocity = Vector2(0,SPEED)
	apply_scale(_velocity)


func _process(_delta:float)->void:
	print(_velocity)
	var collision := move_and_collide(_velocity)
	if collision:
		if collision.colider.has_method("hit"):
			collision.colider.hit()
			self.queue_free()
