extends Area

signal coin_collected

func _ready():
	pass

func _physics_process(delta):
	rotate_object_local(Vector3(0,1,0), deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "Character":
		$AnimationPlayer.play("bounce")
		$Timer.start()

func _on_timer_timeout():
	emit_signal("coin_collected")
	queue_free()
