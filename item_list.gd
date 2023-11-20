extends ItemList



# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.load_from_file("res://sword.png")
	var texture = ImageTexture.create_from_image(image)
	add_item("", texture, true)
	set_item_tooltip(item_count - 1, "It is a sword")
	set_item_tooltip(0, "Food")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
