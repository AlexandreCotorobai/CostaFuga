extends Label

@onready var consts = get_node("/root/Consts")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(consts.score) + "€"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(consts.score) + "€"
	print(self.text)
	print(self.visible)
