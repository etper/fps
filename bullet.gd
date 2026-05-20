extends Area3D

var speed = 40.0
var direction = Vector3.ZERO

func _physics_process(delta):
	global_position += direction * speed * delta


func _on_body_entered(body):
	if body.has_method("die"):
		body.die()

	queue_free()
