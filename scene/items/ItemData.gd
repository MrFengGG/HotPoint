extends Reference

enum WEAPON_TYPE {SWORD=1, DAGGER=2, GUN=3}
enum ITEM_TYPE {WEAPON=1}

const ITEM_DATAS = {
	"w1":{
		"uid":"w1",
		"icon":"res://assert/wave.png",
		"desc":"杀猪刀也是刀",
		"weight":1.5,
		"name":"杀猪刀",
		"itemType":ITEM_TYPE.WEAPON,
		"stackable":false,
		"maxStackNum":1,
		"data":{
			"weaponTexturePath":"res://assert/wave.png",
			"triggerType":2,
			"barrelType":1,
			"clipType":1,
			"barrelTexturePath":"res://assert/wave.png",
			"weaponType":WEAPON_TYPE.SWORD
		},
	},
	"w2":{
		"uid":"w2",
		"icon":"",
		"desc":"运气好也许可以打死一头猪",
		"weight":0.5,
		"name":"火绳枪",
		"itemType":ITEM_TYPE.WEAPON,
		"stackable":false,
		"maxStackNum":1,
		"data":{
			"triggerType":2,
			"barrelType":1,
			"barrelTexturePath":"res://assert/pistol.png",
			"clipType":1,
			"weaponType":WEAPON_TYPE.GUN
		},
	},
	"w3":{
		"uid":"w3",
		"icon":"",
		"desc":"有总比没有好",
		"weight":2,
		"name":"木枪",
		"itemType":ITEM_TYPE.WEAPON,
		"stackable":false,
		"maxStackNum":1,
		"data":{
			"triggerType":2,
			"barrelType":1,
			"barrelTexturePath":"res://assert/stab.png",
			"clipType":1,
			"weaponType":WEAPON_TYPE.DAGGER
		},
	}
}

class_name ItemData
