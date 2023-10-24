extends CharacterBody2D

var attack_power : int = 10


func _on_health_component_on_death():
	queue_free()


func _on_hitbox_component_area_entered(area):
	if area.has_method("damage"):
		area.damage(attack_power)
