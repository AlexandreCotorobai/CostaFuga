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
		print(self.position.x)

		self.velocity = Vector2(consts.SPEED, 0)
		if self.position.x < 1000:
			move_and_slide()
		if self.position.x > 50:
			# loose game
			pass
		
	else:
		$AnimatedSprite2D.stop()

