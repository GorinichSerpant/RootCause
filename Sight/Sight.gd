extends Area2D

export var texture = "res://Sight/TestImage.png"

func _ready():
	var loadTexture = load(texture)
	$Image.texture = loadTexture

func _on_Sight_body_entered(_body):
	$Image.visible = true


func _on_Sight_body_exited(_body):
	$Image.visible = false
