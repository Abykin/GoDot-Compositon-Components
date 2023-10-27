extends Area2D

# Hitbox component manages the entitys hitbox, provided with a health component to measure health
# TODO : emit signal on taking taking damage
# The signal would be used to trigger other events such as adding a box that can be hit to open without it needing health

@export var health_component : HealthComponent

func damage(attack : int):
	if health_component:
		health_component.take_damage(attack)
