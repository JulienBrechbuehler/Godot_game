class_name OptionMenu
extends Control

@onready var back = $MarginContainer/VBoxContainer/Back as Button

signal exit_options_menu

func _ready():
	back.button_down.connect(on_back_pressed)
	set_process(false)
	
func on_back_pressed():
	exit_options_menu.emit()
	set_process(false)
