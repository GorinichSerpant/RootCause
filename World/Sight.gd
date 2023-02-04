extends Area2D


func _on_Sight_body_entered(body):
	$Image.visible = true


func _on_Sight_body_exited(body):
	$Image.visible = false
