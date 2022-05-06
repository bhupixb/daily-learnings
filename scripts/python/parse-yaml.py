import yaml
from functools import reduce

pods = None

with open('output.yaml', 'r') as f:
	content = yaml.load(f, Loader=yaml.SafeLoader)

# access nested keys in a dictionary
def deep_get(dictionary, *keys):
    return reduce(lambda d, key: d.get(key) if d else None, keys, dictionary)

# for item in content.get('some_key'):
	# print(item)
