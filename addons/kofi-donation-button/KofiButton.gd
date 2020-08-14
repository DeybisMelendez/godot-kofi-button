tool
extends MarginContainer

enum COLOR {red, blue, yellow, gray}
export (COLOR) var color setget _set_color
export (String) var text = "Support me on Ko-fi" setget _set_text, _get_text
export (bool) var show_text = true setget _set_show_text#, _get_hide_text
export (String) var kofi_page = ""
signal pressed

func _enter_tree():
	$Button.connect("button_up", self, "on_pressed")

func _set_color(col):
	var style = $Button.get("custom_styles/normal").duplicate()
	match col:
		0:
			style.bg_color = Color("FF5E5B")
		1:
			style.bg_color = Color("29ABE0")
		2:
			style.bg_color = Color("FBAA19")
		3:
			style.bg_color = Color("434B57")
	color = col
	$Button.set("custom_styles/normal", style)
	$Button.set("custom_styles/hover", style)
	$Button.set("custom_styles/pressed", style)

func _set_text(txt):
	$HBoxContainer/Label.text = txt
#	text = txt

func _get_text():
	return $HBoxContainer/Label.text

func _set_show_text(value):
	$HBoxContainer/Label.visible = value
	show_text = value

func _get_hide_text():
	$HBoxContainer/Label.visible

func on_pressed():
	emit_signal("pressed")
	OS.shell_open(kofi_page)
