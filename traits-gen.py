#!/usr/bin/env python3

traits = ['ugly', 'beautiful', 'blind', 'rich', 'strong',  'mermaid', 'smart',
          'loves the sea', 'protected by dragon', 'cursed', 'mage', 'drunkard', 'smelly', 'evil']

json = "["

combinations = {}

for a in traits:
    for b in traits:
        if f'{b},{a}' in combinations:
            val = combinations[f"{b},{a}"]
            json += f'["{a}", "{b}", {val}]'
        else:
            print(f"{a} and {b} ", end="")
            val = input()
            combinations[f'{a},{b}'] = val
            json += f'["{a}", "{b}", {val}]'

json += "]"

print(json)
