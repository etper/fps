extends Node3D

@export var enemy_scene : PackedScene

@onready var player = $Player

@onready var timer = $Timer

var score = 0

func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()

	add_child(enemy)

	enemy.global_position = Vector3(
		randf_range(-20, 20),
		1,
		randf_range(-20, 20)
	)

	enemy.player = player

func add_score():
	score += 1

	timer.wait_time = max(0.3, timer.wait_time - 0.1)

	print("Score: ", score)
	print("Spawn Time: ", timer.wait_time)
