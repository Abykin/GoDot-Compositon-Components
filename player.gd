extends CharacterBody2D

@onready var health_component : HealthComponent = $HealthComponent
@onready var sword_animation : AnimationPlayer = $AnimationPlayer

var attack_power : int = 15


func _process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * 500
	
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		health_component.heal(5)
	if Input.is_action_just_pressed("Buff 1"):
		health_component.update_max_health(10)
	if Input.is_action_just_pressed("Buff 2"):
		sword_animation.play("sword_attack")

func _on_hitbox_component_area_entered(_area):
	pass


func _on_health_component_on_health_change(health_change_type):
	print("Player health changed ", health_change_type, " ", health_component.current_health)


func _on_sword_attack_area_area_entered(area):
	if area.has_method("damage"):
		area.damage(attack_power)
