
extends Control

func _fixed_process(delta):
	if(OS.is_fullscreen()):
		get_node("Label_Fullscreen").set_text("Mode:\nFullscreen")
	else:
		get_node("Label_Fullscreen").set_text("Mode:\nWindowed")
	
	get_node("Label_Position").set_text( str("Position:\n", OS.get_window_position() ) )
	
	get_node("Label_Size").set_text(str("Size:\n", OS.get_window_size() ) )
	
	get_node("Label_Screen_Count").set_text( str("Screens:\n", OS.get_screen_count() ) )
	
	get_node("Label_Screen_Current").set_text( str("Current:\n", OS.get_screen() ) )
	
	get_node("Label_Screen0_Resolution").set_text( str("Screen0 Resolution:\n", OS.get_screen_size() ) )
	
	get_node("Label_Screen0_Position").set_text(str("Screen0 Position:\n",OS.get_screen_position()))
	
	if(OS.get_screen_count() > 1):
		get_node("Button_Screen1").show()
		get_node("Label_Screen1_Resolution").show()
		get_node("Label_Screen1_Position").show()
		get_node("Label_Screen1_Resolution").set_text( str("Screen1 Resolution:\n", OS.get_screen_size(1) ) )
		get_node("Label_Screen1_Position").set_text( str("Screen1 Position:\n", OS.get_screen_position(1) ) )
	else:
		get_node("Button_Screen1").hide()
		get_node("Label_Screen1_Resolution").hide()
		get_node("Label_Screen1_Position").hide()
		
	if( Input.is_action_pressed("ui_right")):
		OS.set_screen(1)
		
	if( Input.is_action_pressed("ui_left")):
		OS.set_screen(0)
		
	if( Input.is_action_pressed("ui_up")):
		OS.set_fullscreen(true)
		
	if( Input.is_action_pressed("ui_down")):
		OS.set_fullscreen(false)
		
func _ready():
	set_fixed_process(true)


func _on_Fullscreen_toggled( pressed ):
	if(pressed):
		OS.set_fullscreen(true)
	else:
		OS.set_fullscreen(false)


func _on_Button_MoveTo_pressed():
	OS.set_window_position( Vector2(100,100) )


func _on_Button_Resize_pressed():
	OS.set_window_size( Vector2(1024,768) )


func _on_Button_Screen0_pressed():
	OS.set_screen(0)


func _on_Button_Screen1_pressed():
	OS.set_screen(1)
