extends TextureRect

@onready var animationPlayer = $AnimationPlayer


func ShowBoxTexts():
	var texture = load("res://Sobo To boku Assets/textwindow.png")
	self.texture = texture
	animationPlayer.current_animation = "FadeIn"
	await animationPlayer.animation_finished

func HideBoxTexts():
	animationPlayer.current_animation = "FadeOut"
	await animationPlayer.animation_finished

func WaitForSeconds(seconds: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(seconds)
	await timer.timeout
	timer.queue_free()
