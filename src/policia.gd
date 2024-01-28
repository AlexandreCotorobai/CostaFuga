extends CharacterBody2D

@onready var consts = get_node("/root/Consts")

func _ready():
	reset()

func reset():
	set_rotation(0)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if consts.game_running == true:
		$AnimatedSprite2D.play()
		#print(self.position.x)
		if self.position.x < 50:
			self.velocity = Vector2(consts.SPEED, 0)
		else:
			self.velocity = Vector2(consts.police_speed, 0)
			if consts.police_speed < 20:
				consts.police_speed *= 1.01

		move_and_slide()
	else:
		$AnimatedSprite2D.stop()

