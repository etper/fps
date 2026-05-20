extends CharacterBody3D

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

	queue_free()
