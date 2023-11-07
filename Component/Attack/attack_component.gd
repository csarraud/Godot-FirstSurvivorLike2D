extends Node

@export var attack: int = 1
@export var crit_rate: int = 5
@export var crit_additional_damage: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func damage(node: Node):
	if node.has_node("HealthComponent"):
		var health_component = node.get_node("HealthComponent")
		var damage: int = attack
		
		if (randi() % 100 <= crit_rate):
			damage += damage * crit_additional_damage / 100
		
		health_component.damage(damage)
