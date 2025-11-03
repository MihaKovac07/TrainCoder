extends Node2D
@onready var world: Node2D = $".."
#var train_sprites = world.train_sprites
#var wagon_number = world.wagon_number

func _ready() -> void:
	$Play.pressed.connect(play_pressed)
	
func  play_pressed() -> void:
	world.leave_train()
	await get_tree().create_timer(1.0).timeout
	world.train.position = Vector2(199.0, 1223.0)
	world.random_train()
	world.spawn_train(world.train_sprites, world.wagon_number)
