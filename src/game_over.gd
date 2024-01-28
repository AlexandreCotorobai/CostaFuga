class_name GameOver

extends Control

@onready var tryagain_button = $MarginContainer/HBoxContainer/VBoxContainer/tryagain
@onready var exit_button =  $MarginContainer/HBoxContainer/VBoxContainer/exit
const level = preload("res://scenes/main.tscn")


func _ready():
	tryagain_button.button_down.connect(on_tryagain_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_tryagain_pressed() -> void:
	get_tree().change_scene_to_packed(level)

func on_exit_pressed() -> void:
	get_tree().quit()
