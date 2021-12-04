extends Node2D

const MIN_AGE = 18
const MAX_AGE = 35

const TRAIT = [
	'ugly', 'beautiful', 'blind', 'rich', 'strong',  'mermaid', 'smart', 'loves the sea',
	'protected by dragon', 'cursed', 'mage', 'drunkard', 'smelly', 'evil'
]

const LOOK = {
	hair_length = [
		"Short Hair",
		"Long Hair",
	],
	hair_color = [
		"Blonde",
		"Brown",
		"Red",
	],
	eye_color = [
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
	"Female",
	"Male",
	"Bi",
]

var age

var traits

var looks
var preference

var zodiac

var sex
var sexuality

func to_set(arr: Array):
	for i in range(0, len(arr)):
		var inv = len(arr) - i - 1
		for j in range(0, i):
			if arr[i] == arr[j]:
				arr.remove(i)
				break

func is_compatible(trait_a, trait_b):
	var a = TRAIT[trait_a]
	var b = TRAIT[trait_b]
	for i in TraitRelations.relations:
		if a == i[0] and b == i[1]:
			return i[2] >= 0.0

func to_compatible(arr: Array):
	for i in range(0, len(arr)):
		var inv = len(arr) - i - 1
		for j in range(0, i):
			var trait_i = arr[i]
			var trait_j = arr[j]
			if not is_compatible(trait_i, trait_j):
				arr.remove(i)
				break

func rand_traits_count(day):
	var acc = 0
	for i in range(day):
		acc += 1 if randf() < .5 else 0
	return acc

func init(day: int, sex_):
	age = randi() % (MAX_AGE - MIN_AGE + 1) + MIN_AGE
	zodiac = randi() % len(ZODIAC)
	sex = sex_ if sex_ else randi() % len(SEX)
	sexuality = randi() % len(SEXUALITY)
	
	traits = []
	for i in range(rand_traits_count(day)):
		traits.push_back(randi() % len(TRAIT))
		to_set(traits)
		to_compatible(traits)
	
	looks = {
		hair_length = randi() % len(LOOK.hair_length),
		hair_color = randi() % len(LOOK.hair_color),
		eye_color = randi() % len(LOOK.eye_color),
	}
	
	var key = LOOK.keys()[randi() % len(LOOK.keys())]
	preference = {
		key = key,
		value = randi() % len(LOOK[key]),
	}
	
	dump()

func dump():
	print("person")
	print("\tage: ", age)
	print("\tzodiac: ", ZODIAC[zodiac])
	print("\tsex: ", SEX[sex])
	print("\tsexuality: ", SEXUALITY[sexuality])
	print("\ttraits")
	for trait in traits:
		print("\t\t", TRAIT[trait])
	print("\tlooks")
	print("\t\thair length: ", LOOK.hair_length[looks.hair_length])
	print("\t\thair color: ", LOOK.hair_color[looks.hair_color])
	print("\t\teye color: ", LOOK.eye_color[looks.eye_color])
	print("\tpreference: ", preference.key, " ", LOOK[preference.key][preference.value])
