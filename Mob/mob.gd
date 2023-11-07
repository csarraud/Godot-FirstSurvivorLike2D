extends CharacterBody2D


@onready var attack_component = $AttackComponent

func _ready():
	pass


func _physics_process(delta):
	pass


func _on_hurt_box_body_entered(body):
	attack_component.damage(body)
