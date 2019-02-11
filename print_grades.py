import yaml
import json
import sys
import fractions
import unidecode

def open_config():
	with open("zucchini.yml", 'r') as stream:
	    try:
	        return(yaml.load(stream))
	    except yaml.YAMLError as exc:
	        print(exc)

def print_passed(name):
	print '\nTEST: %-45s %-15s\n' % (name, "PASSED")

def print_failed(name, reason):
	print '\nTEST: %-45s %-15s\n' % (name, "FAILED")
	print '\n%20s\n' % (reason)

def main():

	zucc_config = open_config()

	components = json.load(sys.stdin)


	for i in range(len(components)):
		component = components[i]
		zucc_component = zucc_config["components"][i]


		for j in range(len(component["part-grades"])):
			graded_part = component["part-grades"][j]
			zucc_part = zucc_component["parts"][j]

			score = graded_part["score"]
			grade = float(sum(fractions.Fraction(x) for x in unidecode.unidecode(score).split()))
			if (grade == 1.0):
				print_passed(zucc_part["test"])
			else:
				print_failed(zucc_part["test"],graded_part["log"])


main()