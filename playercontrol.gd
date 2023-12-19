extends Area2D

@export var speed = 400
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"
@onready var audio_stream_player_2d_2 = $"../AudioStreamPlayer2D2"

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta



func _on_area_entered(area):
	hide()
	$"../AudioStreamPlayer2D".stop()
	$"../AudioStreamPlayer2D2".play()
