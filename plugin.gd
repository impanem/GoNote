@tool
extends EditorPlugin

const NOTE_PANEL = preload("res://addons/GoNote/note_panel.tscn")
var new_note_panel

func _enter_tree():
	new_note_panel = NOTE_PANEL.instantiate()
	
	#add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UR, new_note_panel)
	add_control_to_bottom_panel(new_note_panel, "GoNote")


func _exit_tree():
	#remove_control_from_docks(new_note_panel)
	remove_control_from_bottom_panel(new_note_panel)
	
	if not EditorInterface.get_resource_filesystem().is_scanning():
		EditorInterface.get_resource_filesystem().scan()
	
	new_note_panel.queue_free()
