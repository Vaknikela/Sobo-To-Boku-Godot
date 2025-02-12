extends Node

@onready var Background = get_node("/root/Scenery/Sprite2D")
var viewport_size = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size2 = get_viewport().get_visible_rect().size
	viewport_size = viewport_size2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func FadeBackGround():
	var texture = load("res://Sobo To boku Assets/Fondos/0192.webp")
	var texture_size = texture.get_size()
	Background.scale = viewport_size / texture_size
	var sprite_size_scaled = texture_size * Background.scale
	Background.position = (viewport_size - sprite_size_scaled) / 4
	Background.texture = texture
