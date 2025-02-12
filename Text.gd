extends Control

@onready var label = $Label
@onready var richTextLabel = $RichTextLabel
@onready var BackGround = $"../BackGround/TextureRect"
@onready var BoxText = $"../BoxText/TextureRect"
@onready var Character = $"../Character/TextureRect"
var time_since_last_letter = 0
var text_speed = -0.3  # Velocidad para mostrar cada letra
var EndVisibleChatacter = false
var FilePaths = {
	"background": "res://Sobo To boku Assets/Fondos/",
	"character": "res://Sobo To boku Assets/Obaa-chan/",
	"boxText": "res://Sobo To boku Assets/textwindow.png"
}

func _ready():
	pass

func _process(delta):
	if EndVisibleChatacter == true:
		# Si estamos mostrando el texto progresivamente
		if richTextLabel.visible_characters < richTextLabel.get_total_character_count():
			time_since_last_letter += delta
			
			if time_since_last_letter >= text_speed:
				time_since_last_letter = 0  # Reinicia el contador
				richTextLabel.visible_characters += 1
		
	# Detecta clic o tecla para mostrar el diálogo completo
		if Input.is_action_just_pressed("ui_accept"):
			if richTextLabel.visible_characters < richTextLabel.get_total_character_count():
				richTextLabel.visible_characters = richTextLabel.get_total_character_count()
			else:
				EndVisibleChatacter = false

	pass

func ShowTexts(BackGroundName, CharacterName, BoxTextName, NameText = "Void", DialogText = "Void"):
	RememberPreviousImages(BackGroundName, CharacterName, BoxTextName)
	richTextLabel.visible_characters = 0
	richTextLabel.text = DialogText
	label.text = NameText
	EndVisibleChatacter = true
	while EndVisibleChatacter:
		await WaitForSeconds(0.1)

func RememberPreviousImages(BackGroundName = "", CharacterName = "", BoxTextName = ""):
	if not BackGroundName == "":
		var texturePath = FilePaths["background"] + BackGroundName
		BackGround.texture = load(texturePath)
	if not CharacterName == "":
		var texturePath = FilePaths["character"] + CharacterName
		Character.texture = load(texturePath)
	if not BoxTextName == "":
		var texturePath = FilePaths["boxText"]
		BoxText.texture = load(texturePath)

func WaitForSeconds(seconds: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(seconds)
	await timer.timeout
	timer.queue_free()
