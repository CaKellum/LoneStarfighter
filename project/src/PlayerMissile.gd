extends KinematicBody2D


var _velocity :=  Vector2()

func fired(pos:Vector2, speed:int)->void:
	if speed != -10:
		for i in collision_mask:
			set_collision_layer_bit(i,false)
			set_collision_mask_bit(i,false)
		set_collision_layer_bit(0,true)
		set_collision_mask_bit(0,true)
	position = pos
	_velocity = Vector2(0,speed)


func _physics_process(_delta:float)->void:
	var collision := move_and_collide(_velocity)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			self.queue_free()
	if position.y<0:
		self.queue_free()
