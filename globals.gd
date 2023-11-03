extends Node

@export var player_pos : Vector2
@export var player_stats : CharacterStats = load("res://character_stats.tres")
@export var current_experience : int :
	get:
		return current_experience
	set(value):
		current_experience = value
		if current_experience >= maximum_experience:
			current_experience = 0
			player_stats.level += 1
		show_information()
		

@export var maximum_experience : int = 50

func _ready():
	current_experience = player_stats.current_experience

func show_information():
	print("Current Experience : ", current_experience)
	print("Current Level : ", player_stats.level)
