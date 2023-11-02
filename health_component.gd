extends Node
class_name HealthComponent

# Health component is resposible for manageing all things related to health
# Two Signals are Emitted
# On Death signal - when health fully runs out
# On Health Change signal - when health changes either positive or negative

signal on_death
signal on_health_change(health_change_type)

@onready var vulnerable_timer : Timer = $VulnerableTimer

@export var max_health : int = 100
@export var current_health : int
@export var is_damaged : bool = false
@export var is_vulnerable : bool = true
@export var vulnerability_time : float = 0.1

func _ready():
	current_health = max_health
	vulnerable_timer.wait_time = vulnerability_time
	
func heal(amount : int):
	current_health += amount
	current_health = min(current_health, max_health)
	is_damaged = true if current_health < max_health else false
	on_health_change.emit("Heal")

func take_damage(amount : int):
	if is_vulnerable:
		is_vulnerable = false
		vulnerable_timer.start()
		print("taking dmg", amount, " on object : ", self.get_parent())
		current_health -= amount
		current_health = max(0, current_health)
		on_health_change.emit("Damage")
		is_damaged = true if current_health < max_health else false
	
	if current_health <= 0:
		on_death.emit()

func update_max_health(amount : int):
	max_health += amount
	on_health_change.emit("Max Health Increase")


func _on_vulnerable_timer_timeout():
	is_vulnerable = true
