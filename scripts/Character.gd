extends KinematicBody

const acceleration: float = 0.1
var velocity = Vector3.ZERO
var speed: float = 9

func _ready():
	pass

func _physics_process(delta):
	var strength = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized() * speed
	
	var motion = Vector2(
		lerp(velocity.x, strength.x, acceleration),
		lerp(velocity.z, strength.y, acceleration)
	)
	
	velocity.x = motion.x
	velocity.z = motion.y
	$MeshInstance.rotate_z(deg2rad(-velocity.x))
	$MeshInstance.rotate_x(deg2rad(velocity.z))
	
	move_and_slide(velocity)


func _on_enemy_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://GameOver.tscn")
