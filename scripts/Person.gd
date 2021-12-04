extends Node2D

const MIN_AGE = 18
const MAX_AGE = 35

const TRAIT = [
	'ugly', 'beautiful', 'blind', 'rich', 'strong',  'mermaid', 'smart', 'loves the sea',
	'protected by dragon', 'cursed', 'mage', 'drunkard', 'smelly', 'evil'
]

const LOOK = {
	HAIR_LENGTH = [
		"Short Hair",
		"Long Hair",
	],
	HAIR_COLOR = [
		"Blonde",
		"Brown",
		"Red",
	],
	EYE_COLOR = [
		"Brown",
		"Blue",
		"Green",
	],
}

const ZODIAC = [
	"Aries",
	"Taurus",
	"Gemini",
	"Cancer",
	"Leo",
	"Virgo",
	"Libra",
	"Scorpio",
	"Sagittarius",
	"Capricorn",
	"Aquarius",
	"Pisces",
]

var SEX = [
	"Female",
	"Male",
]

var SEXUALITY = [
	"Hetero",
	"Homo",
	"Bi",
]

var age

var traits

var looks
var preference

var zodiac

var sex
var sexuality

func _ready():
	init(3)

func to_set(arr: Array):
	for i in range(0, len(arr)):
		var inv = len(arr) - i - 1
		for j in range(0, i):
			if arr[i] == arr[j]:
				arr.remove(i)
				break

func init(day: int):
	age = randi() % (MAX_AGE - MIN_AGE) + MIN_AGE
	zodiac = randi() % len(ZODIAC)
	sex = randi() % len(SEX)
	sexuality = randi() % len(SEXUALITY)
	
	traits = []
	for i in range(0, day):
		traits.push_back(randi() % len(TRAIT))
		to_set(traits)
	
	looks = {
		hair_length = randi() % len(LOOK.HAIR_LENGTH),
		hair_color = randi() % len(LOOK.HAIR_COLOR),
		eye_color = randi() % len(LOOK.EYE_COLOR),
	}
	
	var key = LOOK.keys()[randi() % len(LOOK.keys())]
	preference = {
		key = key,
		value = randi() % len(LOOK[key]),
	}
	
	dump()

func dump():
	print("person")
	print("\tage ", age)
	print("\tzodiac ", ZODIAC[zodiac])
	print("\tsex ", SEX[sex])
	print("\tsexuality ", SEXUALITY[sexuality])
	print("\ttraits")
	for trait in traits:
		print("\t\t", TRAIT[trait])
	print("\tlooks")
	print("\t\thair length ", LOOK.HAIR_LENGTH[looks.hair_length])
	print("\t\thair color ", LOOK.HAIR_COLOR[looks.hair_color])
	print("\t\teye color ", LOOK.EYE_COLOR[looks.eye_color])
	print("\tpreference ", preference.key, " ", LOOK[preference.key][preference.value])
