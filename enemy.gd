extends CharacterBody3D

@onready var hit_sfx = $HitSFX

var speed = 3.0
var player = null

enum EnemyType {
	NORMAL,
	FAST
}

var enemy_type = EnemyType.NORMAL

func _ready():
	scale = Vector3.ZERO

	var tween = create_tween()

	tween.parallel().tween_property(
		self,
		"scale",
		Vector3.ONE,
		0.2
	).set_trans(Tween.TRANS_BACK)

	tween.parallel().tween_property(
		self,
		"rotation_degrees:y",
		360.0,
		0.2
	)

func _physics_process(delta):
	if player == null:
		return

	var direction = (
		player.global_position - global_position
	).normalized()

	velocity = direction * speed

	move_and_slide()

func die():
	var main = get_tree().current_scene

	main.add_score()
	main.show_hitmarker()

	hit_sfx.pitch_scale = randf_range(0.9, 1.1)
	hit_sfx.play()

	# stop enemy
	speed = 0
	$CollisionShape3D.disabled = true

	# death animation
	var tween = create_tween()

	tween.parallel().tween_property(
		self,
		"scale",
		Vector3.ZERO,
		0.25
	)

	tween.parallel().tween_property(
		self,
		"rotation_degrees:z",
		90.0,
		0.25
	)

	tween.parallel().tween_property(
		$MeshInstance3D,
		"transparency",
		1.0,
		0.25
	)

	await tween.finished

	queue_free()

func setup(type):
	enemy_type = type

	match enemy_type:
		EnemyType.NORMAL:
			speed = 3.0
			scale = Vector3.ONE
			$MeshInstance3D.material_override.albedo_color = Color.RED

		EnemyType.FAST:
			speed = 6.0
			scale = Vector3(0.7, 0.7, 0.7)
			$MeshInstance3D.material_override.albedo_color = Color.YELLOW
