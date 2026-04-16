extends CharacterBody3D


@export var speed: int = 4
@export var rotation_speed: int = 2
@onready var head = $Head
@onready var camera = $Head/Camera3D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("cam_left"):
		rotation.y += rotation_speed * delta
	if Input.is_action_pressed("cam_right"):
		rotation.y -= rotation_speed * delta
	
	var input_dir = 0
	if Input.is_action_pressed("move_back"):
		input_dir += 1
	if Input.is_action_pressed("move_front"):
		input_dir -= 1
		
	var direction = (transform.basis * Vector3(0, 0, input_dir)).normalized()
	
	velocity = Vector3.ZERO
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
	move_and_slide()
