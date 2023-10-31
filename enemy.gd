extends CharacterBody2D

# TODO Add simple patrolling AI and a chase method if the player aggros the enemy

@onready var hurt_particles : GPUParticles2D = $HurtParticles

const GRAVITY = 200
const SPEED = 200
var attack_power : int = 10
var chase_player : bool = false
var contact_damage : bool = false
var player_to_attack : Area2D

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if chase_player:
		var direction = (Globals.player_pos - position).normalized()
		velocity.x = direction.x * SPEED
	
	move_and_slide()

func _process(_delta):
	if player_to_attack and contact_damage:
		attack(player_to_attack)

func _on_health_component_on_death():
	queue_free()


func _on_hitbox_component_area_entered(area):
	if area.has_method("damage"):
		player_to_attack = area
		contact_damage = true
		chase_player = false


func _on_health_component_on_health_change(_health_change_type):
	hurt_particles.emitting = true


func _on_hitbox_component_area_exited(area):
	player_to_attack = null
	contact_damage = false
	
func attack(area):
	area.damage(attack_power)
