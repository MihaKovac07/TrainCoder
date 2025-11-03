Ui controller
extends Node2D
@onready var world: Node2D = $".."
#var train_sprites = world.train_sprites
#var wagon_number = world.wagon_number

func _ready() -> void:
	$Play.pressed.connect(play_pressed)
	
func  play_pressed() -> void:
	world.leave_train()
	await get_tree().create_timer(1.0).timeout
	world.random_train()
	world.spawn_train(world.train_sprites, world.wagon_number)

world
extends Node2D
var train_sprites = [0, 1, 2]
var wagon_number = 3
@onready var train: Node2D = $Train

func _ready() -> void:
	random_train()
	spawn_train(train_sprites, wagon_number)

func random_train() -> void:
	train_sprites.shuffle()

func spawn_train(train_sprite, wagon_number) -> void:
	train.position = Vector2(199.0, 1223.0)
	var x = 0
	var y = 200
	var main_vagon = Sprite2D.new()
	main_vagon.position = Vector2(0, 0)
	main_vagon.texture = load("res://Sprites/Wagon_main.png")
	train.add_child(main_vagon)
	for i in range(3):
		var vagon = Sprite2D.new()
		vagon.position = Vector2(x, y)
		vagon.texture = load("res://Sprites/" + str(train_sprites[i]) + ".png")
		train.add_child(vagon)
		y += 200
	var tween = create_tween()
	var target_position = Vector2(199.0, 200)
	tween.tween_property(train, "position", target_position, 1)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

func leave_train() -> void:
	var target_position = Vector2(199.0, -1000)
	var tween = create_tween()
	tween.tween_property(train, "position", target_position, 1)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	
