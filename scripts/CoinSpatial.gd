extends Spatial

signal coin_collected

func _ready():
	pass

func _on_coin_collected():
	emit_signal("coin_collected")
