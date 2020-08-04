extends Node2D
const TriggerTypeEnum = {CONTINUITY = 0, INTERVAL = 1}
const WeaponTypeEnum = {REMOTE = 0, CLOSE = 1}
#是否可攻击
export (bool) var readyToAttack = true
#扳机是否按下
export (bool) var triggerPressed = false
#攻击时间
export (float) var attackTime = 1
#扳机类型
export (TriggerTypeEnum) var triggerType = TriggerTypeEnum.INTERVAL
export (WeaponTypeEnum) var weaponType = WeaponTypeEnum.CLOSE
export (float) var speed = 1
#攻击开始时间
var attackStart = 0
#是否处在攻击状态
var isAttack = false

func _ready():
	pass

func _process(delta):
	#攻击是否结束
	if attackStart >= attackTime:
		attackStart = 0
		isAttack = false 
	#攻击时间累积
	if isAttack:
		attackStart += delta
	#是否开始攻击
	if triggerPressed and readyToAttack:
		attack(delta)
		isAttack = true
		readyToAttack = false
#攻击逻辑
func attack(delta):
	pass
	
func updateTrigger(pressed):
	if !isAttack:
		if triggerType == TriggerTypeEnum.CONTINUITY:
			readyToAttack = pressed
		if triggerType == TriggerTypeEnum.INTERVAL:
			readyToAttack = not triggerPressed or not pressed
		triggerPressed = pressed
