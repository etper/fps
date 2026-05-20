extends Node3D

@export var enemy_scene : PackedScene

@onready var player = $Player

func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()

	add_child(enemy)

	enemy.global_position = Vector3(
		randf_range(-20, 20),
		1,
		randf_range(-20, 20)
	)

	enemy.player = player
