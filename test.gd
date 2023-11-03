extends Node2D

@export var experience_bar : Control


func _process(_delta):
	experience_bar.update_experience_bar(Globals.current_experience)
	experience_bar.update_total_experience_bar(Globals.maximum_experience)
