extends Label

var coins = 0

func _ready():
	text = str(coins)

func _on_coin_collected():
	coins += 1
	_ready()
	if coins == 15:
		get_tree().change_scene("res://YouWin.tscn")
