extends PhysicsBody2D

var velocity = Vector2(-1, 0)
var speed = 200
var bounce_multiplier = 0.01


func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta * speed)

	if collision_info:
		# bounce with default collision behaviour
		velocity = velocity.bounce(collision_info.get_normal())

		# additonal bounce behaviour
		var collider = collision_info.get_collider()

		# check if collider is a player
		if collider.get_script():
			# define bounce magnitude based on vertical distance from player
			var player_position = collider.position
			var distance_y = position.y - player_position.y
			var bounce_magnitude = distance_y * bounce_multiplier

			# behaviour when ball is below player and moving right after default collision
			var bounce_vector = Vector2(bounce_magnitude, bounce_magnitude)

			# reverse horizontal magnitude if ball is above player
			if distance_y < 0:
				bounce_vector = Vector2(-bounce_magnitude, bounce_magnitude)

			# reverse horizontal magnitude if ball is moving left after default collision
			if velocity.x < 0:
				bounce_vector.x = -bounce_vector.x

			velocity += bounce_vector
