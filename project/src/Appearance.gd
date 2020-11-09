extends AnimatedSprite


func _on_Enemy_low_destroyed()->void:
	play("explode")
