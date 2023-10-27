extends CharacterBody2D

# TODO Add simple patrolling AI and a chase method if the player aggros the enemy

@onready var hurt_particles : GPUParticles2D = $HurtParticles

const GRAVITY = 200
const SPEED = 200
var attack_power : int = 10
var chase_player : bool = false

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if chase_player:
		var direction = (Globals.player_pos - position).normalized()
		velocity.x = direction.x * SPEED
	
	move_and_slide()

func _on_health_component_on_death():
	queue_free()


func _on_hitbox_component_area_entered(area):
	if area.has_method("damage"):
		area.damage(attack_power)
		chase_player = true


func _on_health_component_on_health_change(health_change_type):
	hurt_particles.emitting = true
