extends TextureRect

@onready var animationPlayer = $AnimationPlayer

func ShowBackground(Background):
	self.texture = load(Background)
	animationPlayer.current_animation = "FadeIn"
	await animationPlayer.animation_finished

func HideBackground():
	animationPlayer.current_animation = "FadeOut"
	await animationPlayer.animation_finished

func BackgroundTransition(NewBackground):
	animationPlayer.current_animation = "FadeOut2"
	await WaitForSeconds(0.2)
	self.texture = load(NewBackground)
	animationPlayer.current_animation = "FadeIn2"
	await animationPlayer.animation_finished
	pass

func WaitForSeconds(seconds: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(seconds)
	await timer.timeout
	timer.queue_free()
