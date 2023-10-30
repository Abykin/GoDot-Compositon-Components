extends CharacterBody2D

# TODO handle taking damage and create an attack component.

@onready var health_component : HealthComponent = $HealthComponent
@onready var sword_animation : AnimationPlayer = $AnimationPlayer
@onready var sword_scene = preload("res://sword.tscn")

@export var stats: CharacterStats

const SPEED = 300
const JUMP_VELOCITY = -550.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack_power : int = 15
var last_direction : int = 1

func _ready():
	print(stats.intelligence)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		last_direction = direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("Buff 2"):
		var sword = sword_scene.instantiate()
		if last_direction > 0:
			$"Sword Position Right".add_child(sword)
		elif last_direction < 0:
			$"Sword Position Left".add_child(sword)
		sword.sword_hit.connect(_on_sword_attack_area_area_entered)
		sword.sword_attack(last_direction)
	
	Globals.player_pos = global_position
	
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("Buff 3"):
		health_component.heal(5)
	if Input.is_action_just_pressed("Buff 1"):
		health_component.update_max_health(10)

	
func _on_hitbox_component_area_entered(_area):
	pass


func _on_health_component_on_health_change(health_change_type):
	print("Player health changed ", health_change_type, " ", health_component.current_health)


func _on_sword_attack_area_area_entered(area):
	if area.has_method("damage"):
		area.damage(attack_power)
