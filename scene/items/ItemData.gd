extends Reference

enum WEAPON_TYPE {SWORD, DAGGER, GUN}
enum ITEM_TYPE {WEAPON}
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
			"triggerType":2,
			"barrelType":1,
			"barrelTexturePath":"",
			"clipType":1,
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
			"barrelTexturePath":"",
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
			"barrelTexturePath":"",
			"clipType":1,
			"weaponType":WEAPON_TYPE.DAGGER
		},
	}
}
