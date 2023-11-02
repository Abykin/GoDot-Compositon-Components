extends Node2D

@onready var interaction_component : InteractionComponent = $InteractionComponent


const lines: Array[String] = [
	"Hey There!"
]

func _ready():
	interaction_component.interact = Callable(self, "_on_interact")
	
func _on_interact():
	print(lines[0])
