extends Marker2D

signal sword_hit(area)

# Called when the node enters the scene tree for the first time.
func sword_attack(direction):
	if direction > 0:
		$Sword/AnimationPlayer.play("sword_attack_right")
	else:
		$Sword/AnimationPlayer.play("sword_attack_left")

	

func _on_sword_attack_area_area_entered(area):
	sword_hit.emit(area)
