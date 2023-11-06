extends CharacterBody2D


const speed = 300.0

var dash_component = null

func _ready():
	dash_component = $DashComponent

func _physics_process(delta):
	var current_speed = speed
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if dash_component.dash():
		current_speed = dash_component.compute_speed(current_speed)
	
	velocity = velocity.normalized() * current_speed
	
	position += velocity * delta

