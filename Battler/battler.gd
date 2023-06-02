extends Node2D

@export var name_battler: String = "unknown"

@export var maxHeal: int = 0
@export var heal: int = 0
@export var maxStamina: int = 0
@export var stamina: int = 0
@export var maxMana: int = 0
@export var mana: int = 0

@export var pAtk: int = 0
@export var mAtk: int = 0
@export var pDef: int = 0
@export var mDef: int = 0
@export var speed: int = 0

@export var master: int = 0

func _to_string():
	#print("-", name_battler, "-")
	#print("heal:", heal, "/", maxHeal)
	#print("mana:", mana, "/", maxMana)
	#print("stamina:", stamina, "/", maxStamina)
	#print("pAtk:", pAtk, " mAtk:", mAtk)
	#print("pDef:", pDef, " mDef:", mDef)
	#print("SPD:", speed)
	return name_battler

func init(sName:String, sHeal:int, sStamina:int, sMana:int, sPAtk:int, sMAtk:int, spDef:int, sMDef:int, sSpeed:int, sMaster: int):
	name_battler = sName
	maxHealChange(sHeal)
	maxStaminaChange(sStamina)
	maxManaChange(sMana)
	pAtk = sPAtk
	mAtk = sMAtk
	pDef = spDef
	mDef = sMDef
	speed = sSpeed
	master = sMaster
	

func healChange(x):
	heal += x
	if (heal <= maxHeal):
		heal = maxHeal
	
func maxHealChange(x):
	heal += x
	maxHeal += x

func staminaChange(x):
	stamina += x
	if (stamina <= maxStamina):
		stamina = maxStamina
	
func maxStaminaChange(x):
	stamina += x
	maxStamina += x

func manaChange(x):
	mana += x
	if (mana <= maxMana):
		mana = maxMana
	
func maxManaChange(x):
	mana += x
	maxMana += x
	
func _process(delta):
	$Label.text = name_battler
