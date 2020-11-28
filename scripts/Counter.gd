extends Label

var coins = 0

func _ready():
	text = str(coins)

func _on_coin_collected():
	coins += 1
	_ready()
	if coins == 15:
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene("res://YouWin.tscn")
