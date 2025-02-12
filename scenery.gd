extends Node2D

@onready var BackGround = $BackGround/TextureRect
@onready var BoxText = $BoxText/TextureRect
@onready var Character = $Character/TextureRect
@onready var Text = $Text
#var current_index = 0
var AfterImage = {
	"BackgroundImage": "res://Sobo To boku Assets/Fondos/0192.webp",
	"CharacterImage": "res://Sobo To boku Assets/Obaa-chan/0083.webp",
	"BoxTextImage": "res://Sobo To boku Assets/textwindow.png"
}


var sequence = [
	func(): await BackGround.ShowBackground("res://Sobo To boku Assets/Fondos/0192.webp"),
	func(): await BoxText.ShowBoxTexts(),
	func(): await Text.ShowTexts("0192.webp","","Open", "", "En una pacífica tarde de verano, el único sonido que envolvía mi alrededor provenía de la olla burbujeante en donde estaba cocinando, de la estufa que estaba encendida y del canto de las cigarras que yacían en el jardín."),
	func(): await Text.ShowTexts("0192.webp","","Open", "",  "Sin darme cuenta, el tiempo se me había pasado volando mientras cocinaba ya que al mirar el reloj, este marcaba las cuatro."),
	func(): await Character.ShowCharacter("res://Sobo To boku Assets/Obaa-chan/0083.webp", true, true),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "Minako", "「...Parece que ya va siendo hora en la que ese niño aparezca...」"),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "", "Mi esposo fue a la estación del tren a recoger a una persona muy especial para nosotros."),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "???", "「¡Abuela!」"),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "", "Y justo en ese momento, escuché una voz infantil proveniente de la entrada de la casa."),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "", "Sin importar el tiempo que pase, siempre reconoceré su dulce voz."),
	func(): await Text.ShowTexts("0192.webp","0083.webp","Open", "", "Y cuando caminé hacia la puerta..."),
	func(): await FadeOut(),
	func(): await Text.ShowTexts(AfterImage, "", "Y cuando caminé hacia la puerta...")
]

func _ready():
	await execute_sequence(6)
	#get_tree().quit()
	pass

func FadeOut() -> void:
	Character.HideCharacter()
	BoxText.HideBoxTexts()
	await BackGround.BackgroundTransition("res://Sobo To boku Assets/Fondos/0212.webp")

func execute_sequence(current_index = 0) -> void:
	while current_index < sequence.size():
		await sequence[current_index].call()
		current_index += 1
	
