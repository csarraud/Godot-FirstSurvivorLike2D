extends Node

@export var max_hp = 10
@export var hp :int

# Regeneration
@export var regeneration_in_hp_per_sec = 0.25
var regeneration_buffer :float

@onready var health_bar = self.get_parent().get_node("HUD/HealthBar")

signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = max_hp
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Add regeneration value to the buffer
	regeneration_buffer += regeneration_in_hp_per_sec * delta
	# Cast to int and remove the overflow
	var regeneration = int(regeneration_buffer)
	regeneration_buffer -= regeneration
	
	# Regen hp with int only
	hp += regeneration
	
	hp = clamp(hp, 0, max_hp)
	
	if health_bar:
		health_bar.value = hp
		health_bar.max_value = max_hp

func damage(damage_amount):
	hp -= damage_amount
	if hp <= 0:
		death.emit()
		hp = 0
