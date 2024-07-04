extends Control

@onready var play = $MarginContainer/HBoxContainer/VBoxContainer/Play as Button
@onready var options = $MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var quit = $MarginContainer/HBoxContainer/VBoxContainer/Quit as Button
@onready var options_menu = $"Options_Menu" as OptionMenu
@onready var margin_container = $MarginContainer as MarginContainer
#@onready var start_level = preload("res://scenes/game.tscn") as PackedScene

func _ready():
	handle_connecting_signals()

func on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func on_options_pressed():
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true


func on_quit_pressed():
	get_tree().quit(0)


func on_back_option_menu():
	margin_container.visible = true
	options_menu.visible = false


func handle_connecting_signals():
	play.button_down.connect(on_play_pressed)
	options.button_down.connect(on_options_pressed)
	quit.button_down.connect(on_quit_pressed)
	options_menu.exit_options_menu.connect(on_back_option_menu)
