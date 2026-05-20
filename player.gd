extends CharacterBody3D

const SPEED = 6.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.002

@export var bullet_scene : PackedScene

@onready var gun_sfx = $Camera3D/GunSFX

@onready var bullet_spawn = $BulletSpawn

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

const RECOIL_STRENGTH = 0.01
const RECOIL_RECOVER = 8.0

var recoil_x = 0.0

@onready var camera = $Camera3D
@onready var raycast = $RayCast3D

@onready var muzzle_flash = $Camera3D/MuzzleFlash

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot()
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENS)
		
		camera.rotate_x(-event.relative.y * MOUSE_SENS)
		
		camera.rotation.x = clamp(
			camera.rotation.x,
			deg_to_rad(-90),
			deg_to_rad(90)
		)

func _physics_process(delta):

	recoil_x = lerp(recoil_x, 0.0, RECOIL_RECOVER * delta)

	camera.rotation.x += recoil_x

	# gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# movement input
	var input_dir = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	var direction = (
		transform.basis *
		Vector3(input_dir.x, 0, input_dir.y)
	).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func shoot():
	var bullet = bullet_scene.instantiate()

	get_tree().current_scene.add_child(bullet)

	bullet.global_position = camera.global_position

	bullet.direction = -camera.global_transform.basis.z

	gun_sfx.stop()
	gun_sfx.play()

	recoil_x += RECOIL_STRENGTH

	muzzle_flash.visible = true

	await get_tree().create_timer(0.05).timeout

	muzzle_flash.visible = false
