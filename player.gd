extends CharacterBody3D


var speed: int = 4
var rotation_speed: int = 2
@onready var head = $Head
@onready var camera = $Head/Camera3D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_left"):
		rotation.y += rotation_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation.y -= rotation_speed * delta
	
	var input_dir = 0
	if Input.is_action_pressed("ui_down"):
		input_dir += 1
	if Input.is_action_pressed("ui_up"):
		input_dir -= 1
		
	var direction = (transform.basis * Vector3(0, 0, input_dir)).normalized()
	
	velocity = Vector3.ZERO
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
	move_and_slide()
