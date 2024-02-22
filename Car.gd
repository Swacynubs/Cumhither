extends CharacterBody2D

var angle = 270
@export var ACCELERATION = 0.05
@export var MAXSPEED = 1
@export var FRICTION = 0.1
@export var TURNPOWER = 3

var speed = 0

func on_ready():
	rotation = angle

func _process(delta):
	if Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		speed += ACCELERATION * Input.get_vector("RIGHT","LEFT","DOWN","UP").y
		if speed >= MAXSPEED:
			speed = MAXSPEED
		if speed <= -MAXSPEED:
			speed = -MAXSPEED
	else: 
		if speed >= 0:
			speed -= FRICTION
			velocity.x -= FRICTION
			velocity.y -= FRICTION
		if speed <= 0:
			speed += FRICTION
			velocity.x += FRICTION
			velocity.y += FRICTION
		if speed >= -0.25 and speed <= 0.25:
			speed = 0
			velocity.x = 0
			velocity.y = 0
	
	if Input.is_action_pressed("LEFT") and speed != 0:
		angle -= TURNPOWER
	if Input.is_action_pressed("RIGHT") and speed != 0:
		angle += TURNPOWER
	
	velocity.y += sin(deg_to_rad(angle))*speed
	velocity.x += cos(deg_to_rad(angle))*speed
#	print(sin(deg_to_rad(angle)))
#	print(cos(deg_to_rad(angle)))
	move_and_slide()
	rotation = deg_to_rad(angle+90)
	print(velocity.y)
#	move_and_collide(velocity)
