extends Node

var wall_scene = load("res://scenes/wall.tscn")
var ball_scene = load("res://scenes/ball.tscn")
var player_scene = load("res://scenes/player.tscn")

var screen_size


func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size
	new_game()


func new_game() -> void:
	var floor_wall = wall_scene.instantiate()
	var ceiling_wall = wall_scene.instantiate()
	var ball = ball_scene.instantiate()

	var x_middle = screen_size.x * 0.5
	var y_middle = screen_size.y * 0.5

	floor_wall.position = Vector2(x_middle, screen_size.y + 8)
	ceiling_wall.position = Vector2(x_middle, 0 - 8)
	ball.position = Vector2(x_middle, y_middle)

	add_child(floor_wall)
	add_child(ceiling_wall)
	add_child(ball)

	for i in range(2):
		var player = player_scene.instantiate()
		player.id = i
		player.name = "Player" + str(i)

		add_child(player)

		if i == 0:
			player.position = Vector2(16, y_middle)

		else:
			player.position = Vector2(screen_size.x - 16, y_middle)
