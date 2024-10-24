extends StaticBody2D

var screen_size
var id

var speed = 400


func _ready() -> void:
	screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	if id == 0:
		if Input.is_action_pressed("move_down_0"):
			velocity.y += 1

		if Input.is_action_pressed("move_up_0"):
			velocity.y -= 1

	if id == 1:
		if Input.is_action_pressed("move_down_1"):
			velocity.y += 1

		if Input.is_action_pressed("move_up_1"):
			velocity.y -= 1

	position += velocity * delta * speed
	position = position.clamp(Vector2(0, 0 + 32), Vector2(screen_size.x, screen_size.y - 32))
