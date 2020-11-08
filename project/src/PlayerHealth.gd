class_name HealthManager
extends Node2D

var lives := 0

func _init(entered_lives:int)->void:
	lives = entered_lives

func loose_a_life()->void:
	if lives>0:
		lives -= 1


func add_a_life()->void:
	lives += 1


func has_lives()->bool:
	return lives>0
