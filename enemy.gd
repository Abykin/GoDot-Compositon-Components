extends CharacterBody2D

@onready var hurt_particles : GPUParticles2D = $HurtParticles

const GRAVITY = 200
var attack_power : int = 10

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	move_and_slide()

func _on_health_component_on_death():
	queue_free()


func _on_hitbox_component_area_entered(area):
	if area.has_method("damage"):
		area.damage(attack_power)


func _on_health_component_on_health_change(health_change_type):
	hurt_particles.emitting = true
