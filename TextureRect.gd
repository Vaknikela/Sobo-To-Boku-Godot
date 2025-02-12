extends TextureRect

@onready var animationPlayer = $AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		animationPlayer.current_animation = "FadeTotally"
	pass

func ShowBackground(Background):
	var texture = load(Background)
	self.texture = texture
	animationPlayer.current_animation = "Fade"
