extends Area2D

@export var ten_socket: String = "LGA1700"
var da_lap: bool = false

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(area):
	if area.get_parent().has_method("ve_vi_tri_cu"):
		area.get_parent().vung_cam_hien_tai = self

func _on_area_exited(area):
	if area.get_parent().has_method("ve_vi_tri_cu"):
		if area.get_parent().vung_cam_hien_tai == self:
			area.get_parent().vung_cam_hien_tai = null
