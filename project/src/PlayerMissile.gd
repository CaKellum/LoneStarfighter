extends KinematicBody2D


const SPEED := -10

var _velocity :=  Vector2()

func fired(pos:Vector2)->void:
	position = pos
	_velocity = Vector2(0,SPEED)


func _physics_process(_delta:float)->void:
	var collision := move_and_collide(_velocity)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			self.queue_free()
	if position.y<0:
		self.queue_free()
