class_name Missile
extends KinematicBody2D


const SPEED := 10
var _velocity :=  Vector2()

func fired(pos:Vector2)->void:
	self.position = pos
	_velocity = Vector2(0,SPEED)

func _physics_process(delta:float):
	var collision := move_and_collide(_velocity*delta)
	if collision:
		if collision.colider.has_method("hit"):
			collision.colider.hit()
			self.queue_free()
