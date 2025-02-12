extends Node2D

@onready var BackGround = $BackGround/TextureRect
@onready var BoxText = $BoxText/TextureRect
@onready var Character = $Chacacter/TextureRect
@onready var Text = $Text
var IndexToShow = 0

func Save():
	var IndexToSave = IndexToShow
	var BackGroundToSave = BackGround.texture

func WaitForSeconds(seconds: float) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.start(seconds)
	await timer.timeout
	timer.queue_free()
