class_name MainMenu

extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/start
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/exit
const level = preload("res://scenes/main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level)

func on_exit_pressed() -> void:
	get_tree().quit()
