extends AnimatedSprite2D

var fade = 0
var inditorFace = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inditorFace == true:
		self.modulate.a += 1
		if self.modulate.a == 255:
			inditorFace = false
	pass
	
func mi_funcion():
	self.modulate.a = 0
	self.play("SceneTwo")
	inditorFace = true
	
