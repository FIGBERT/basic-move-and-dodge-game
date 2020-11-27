extends Button

func _ready():
	pass


func _on_GameOverButton_pressed():
	get_tree().change_scene("res://Level.tscn")
