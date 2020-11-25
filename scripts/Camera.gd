extends Camera

const translate_speed := 0.5
const rotate_speed := 0.95
const fov_speed := 0.95
const near_far_speed := 0.95

func _ready():
	pass

func _process(delta):
	var translate_factor: float = translate_speed * delta * 10
	var rotate_factor: float = rotate_speed * delta * 10
	var target_node := get_node(@"../Character/Viewport")
	var target_xform: Transform = target_node.get_global_transform()
	var local_transform_only_origin := Transform(Basis(), get_global_transform().origin)
	var local_transform_only_basis := Transform(get_global_transform().basis, Vector3())
	local_transform_only_origin = local_transform_only_origin.interpolate_with(target_xform, translate_factor)
	local_transform_only_basis = local_transform_only_basis.interpolate_with(target_xform, rotate_factor)
	set_global_transform(Transform(local_transform_only_basis.basis, local_transform_only_origin.origin))
