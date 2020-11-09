extends AnimatedSprite


func _on_Enemy_low_destroyed():
	play("explode")
