extends CharacterBody3D

@onready var hit_sfx = $HitSFX

var speed = 3.0
var player = null

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

	hit_sfx.play()
	hit_sfx.pitch_scale = randf_range(0.9, 1.1)

	visible = false
	$CollisionShape3D.disabled = true

	await hit_sfx.finished

	queue_free()
