extends Node3D

@export var enemy_scene : PackedScene

@onready var player = $Player

@onready var timer = $Timer

@onready var score_label = $CanvasLayer/Control/ScoreLabel

@onready var hit_marker = $CanvasLayer/Control/HitMarker

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

	if randf() < 0.3:
		enemy.setup(enemy.EnemyType.FAST)
	else:
		enemy.setup(enemy.EnemyType.NORMAL)

func add_score():
	score += 1

	score_label.text = "Score: " + str(score)

	timer.wait_time = max(0.3, timer.wait_time - 0.1)

	print("Score: ", score)
	print("Spawn Time: ", timer.wait_time)

func show_hitmarker():
	hit_marker.visible = true

	await get_tree().create_timer(0.08).timeout

	hit_marker.visible = false
