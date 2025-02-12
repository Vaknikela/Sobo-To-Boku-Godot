extends TextureRect

@onready var animationPlayer = $AnimationPlayer
var ActivatePowerFadeCompletely = ""
var ActivatePowerFadeCompletely2 = ""


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and animationPlayer.is_playing() and ActivatePowerFadeCompletely:
		animationPlayer.current_animation = "FadeCompletely"
	pass

func ShowCharacter(Character, PowerToCompletelyFade, ShowInstantly = false):
	ActivatePowerFadeCompletely = PowerToCompletelyFade
	var texture = load(Character)
	self.texture = texture
	animationPlayer.current_animation = "FadeIn"
	if not ShowInstantly == true: 
		await animationPlayer.animation_finished

func AnimationEspecial1(Character, PowerToCompletelyFade = false):
	ActivatePowerFadeCompletely2 = PowerToCompletelyFade
	self.texture = load(Character)
	animationPlayer.current_animation = "SpecialAnimation"
	await animationPlayer.animation_finished

func HideCharacter():
	animationPlayer.current_animation = "FadeOut"
	await animationPlayer.animation_finished

func CharacterTransition(Character, PowerToCompletelyFade):
	ActivatePowerFadeCompletely = PowerToCompletelyFade
	animationPlayer.current_animation = "FadeOut2"
	self.texture = load(Character)
	animationPlayer.current_animation = "FadeIn2"
	await animationPlayer.animation_finished
	pass

func WaitForSeconds(seconds: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(seconds)
	await timer.timeout
	timer.queue_free()
