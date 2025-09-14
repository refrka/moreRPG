extends Control




func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	reset()

	%NavigationButton.add_callback(_show_page.bind(%NavigationPage))
	%ItemsButton.add_callback(_show_page.bind(%ItemsPage))
	%EntitiesButton.add_callback(_show_page.bind(%EntitiesPage))


func reset() -> void:
	%NavigationPage.visible = false
	%ItemsPage.visible = false
	%EntitiesPage.visible = false
	ObjectHandler.deselect_button_group("encyclopedia_nav")
	ObjectHandler.deselect_button_group("navigation_list")



func _show_page(_page: Node) -> void:
	for page in %PageContainer.get_children():
		if page == _page:
			page.visible = !page.visible
		else:
			page.visible = false




func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		if visible == false:
			reset()