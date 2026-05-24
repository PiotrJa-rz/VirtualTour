extends Node

var panoramas = [
	"res://pomieszczenia-sceny/galeria_owalna_1.tscn",
	"res://pomieszczenia-sceny/galeria_owalna_2.tscn",
	"res://pomieszczenia-sceny/galeria_owalna_3.tscn",
	"res://pomieszczenia-sceny/sala_rady_1.tscn",
	"res://pomieszczenia-sceny/sala_rady_2.tscn",
	"res://pomieszczenia-sceny/sala_wielka_1.tscn",
	"res://pomieszczenia-sceny/sala_wielka_2.tscn",
	"res://pomieszczenia-sceny/sala_wielka_3.tscn",
	"res://pomieszczenia-sceny/sala_rycerska_1.tscn",
	"res://pomieszczenia-sceny/sala_rycerska_2.tscn",
	"res://pomieszczenia-sceny/sala_tronowa_1.tscn",
	"res://pomieszczenia-sceny/sala_tronowa_2.tscn",
	"res://pomieszczenia-sceny/pokoj_marmurowy_1.tscn",
	"res://pomieszczenia-sceny/przedpokoj_sali_wielkiej_1.tscn",
	"res://pomieszczenia-sceny/przedpokoj_sali_wielkiej_2.tscn"
]
var button_pressed_on_map = false
var panorama_index = 0
var panel_visible = true
var map = false

var current_hotspot = ""


var galeria_owalna_hotspots = {
	"gideon": {
		"url": "res://galeria-owalna-eksponaty/gideon.jpg",
		"title": "Ofiara Gedeona (Anioł rozpalając ołtarz ofiarny Gedeona)",
		"description":"Antwerpia (?), ok. 1575-1600"
	},
	"wielki":{
		"url":"res://galeria-owalna-eksponaty/aleksander-wielki.jpg",
		"title": "Bitwa Aleksandra Wielkiego",
		"description": "Flandria, Bruksela, połowa XVII wieku"
	},
	"eufrat": {
		"url":"res://galeria-owalna-eksponaty/eufrat.jpg",
		"title": "Zmiana biegu rzeki Eufrat",
		"description": "Tapiseria z cyklu Dzieje Cyrusa z warsztatu Jana van Tieghema w Brukseli, ok. 1567 r."
	},
	"astiages":{
		"url": "res://galeria-owalna-eksponaty/ZDJ00151.jpg",
		"title": "Astiages i Harpagon",
		"description": "Tapiseria z cyklu Dzieje Cyrusa z warsztatu Jana van Tieghema w Brukseli, ok. 1567 r."
	},
	"dawid": {
		"url": "res://galeria-owalna-eksponaty/ZDJ00148.jpg",
		"title": "Dawid i Abigail",
		"description": "Flandria, ok. 1560. Dar Towarzystwa Miłośników Warszawy"
	}
}

func go_to_panorama(i):
	get_tree().change_scene_to_file(panoramas[i])
func next_panorama():
	panorama_index += 1
	if panorama_index > 14:
		panorama_index = 0
		get_tree().change_scene_to_file(panoramas[0])
	get_tree().change_scene_to_file(panoramas[panorama_index])
	

func previous_panorama():
	panorama_index -= 1
	if panorama_index < 0:
		panorama_index = panoramas.size()-1
	get_tree().change_scene_to_file(panoramas[panorama_index])
