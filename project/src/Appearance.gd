extends AnimatedSprite

func _on_Enemy_destroyed()->void:
	play("explode")
