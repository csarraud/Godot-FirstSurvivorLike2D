extends Node

@onready var dash_cooldown_timer = $DashCooldownTimer
@onready var dash_duration_timer = $DashDurationTimer

var has_dash = true
var is_dashing = false

@export var dash_cooldown = 1.0
@export var dash_duration = 0.25
@export var dash_intensity_in_percent = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func dash():
	if Input.is_action_pressed("dash") and has_dash == true:
		dash_cooldown_timer.start(dash_cooldown)
		dash_duration_timer.start(dash_duration)
		has_dash = false
		is_dashing = true
	return is_dashing

func compute_speed(current_speed):
	return current_speed + (current_speed * dash_intensity_in_percent / 100)

func _on_dash_cooldown_timer_timeout():
	has_dash = true

func _on_dash_duration_timer_timeout():
	is_dashing = false
