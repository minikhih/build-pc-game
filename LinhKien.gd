extends TextureButton

@export var loai_linh_kien: String = "CPU"
@export var socket_tuong_thich: String = "LGA1700"

var dang_keo: bool = false
var vi_tri_cu: Vector2
var vung_cam_hien_tai: Area2D = null

func _ready():
	vi_tri_cu = global_position
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _process(_delta):
	if dang_keo:
		global_position = get_global_mouse_position() - (size / 2)

func _on_button_down():
	dang_keo = true
	z_index = 10 

func _on_button_up():
	dang_keo = false
	z_index = 0
	
	if vung_cam_hien_tai != null:
		if vung_cam_hien_tai.ten_socket == socket_tuong_thich and not vung_cam_hien_tai.da_lap:
			global_position = vung_cam_hien_tai.global_position - (size / 2)
			vung_cam_hien_tai.da_lap = true
			disabled = true
		else:
			ve_vi_tri_cu()
	else:
		ve_vi_tri_cu()

func ve_vi_tri_cu():
	var tween = create_tween()
	tween.tween_property(self, "global_position", vi_tri_cu, 0.2).set_trans(Tween.TRANS_SINE)
