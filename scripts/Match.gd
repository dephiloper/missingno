extends Node2D

func normalize_age(age: float):
	return (age - Person.MIN_AGE) / (float(Person.MAX_AGE) - Person.MIN_AGE)

func score_age(day, a, b):
	return 1.0 - abs(normalize_age(a.age) - normalize_age(b.age))

func score_trait(a, b):
	for relation in TraitRelations.relations:
		if relation[0] == Person.TRAIT[a] and relation[1] == Person.TRAIT[b]:
			return relation[2]

func score_traits(day, a, b):
	if day < 1: return 0
	var acc = 0
	for i in a.traits:
		for j in b.traits:
			acc += score_trait(i, j)
	return acc

func score_looks(day, a, b):
	if day < 2: return 0
	var acc = 0
	acc += 1 if a.looks[b.preference.key] == b.preference.value else 0
	acc += 1 if b.looks[a.preference.key] == a.preference.value else 0
	return acc

func score_sex(day, a, b):
	if day < 4: return 0
	var acc = 0
	acc += 0 if a.sexuality == 2 or a.sexuality == b.sex else -2
	acc += 0 if b.sexuality == 2 or b.sexuality == a.sex else -2
	return acc

func match_people(day: int, a, b):
	var age = score_age(day, a, b)
	var traits = score_traits(day, a, b)
	var looks = score_looks(day, a, b)
	var sex = score_sex(day, a, b)
	
	var acc = age + traits + looks + sex
	acc = round(acc * 10) / 10
	dump(acc, age, traits, looks, sex)

func dump(acc, age, traits, looks, sex):
	print("match with score: ", acc)
	print("\tage: ", age)
	print("\ttraits: ", traits)
	print("\tlooks: ", looks)
	print("\tsex: ", sex)
