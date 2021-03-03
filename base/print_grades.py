import yaml
import json
import sys
import fractions
import unidecode

def open_config():
    with open("zucchini.yml", 'r') as stream:
        try:
            return(yaml.load(stream, Loader=yaml.FullLoader))
        except yaml.YAMLError as exc:
            print(exc)

def print_passed(name):
    print('\nTEST: %-45s %-15s\n' % (name, "PASSED"))

def print_failed(name, reason):
    print('\nTEST: %-45s %-15s\n' % (name, "FAILED"))
    print('\n%20s\n' % (reason))

def main():

    zucc_config = open_config()

    components = json.load(sys.stdin)

    for component, zucc_component in zip(components, zucc_config["components"]):
        if "part-grades" not in component:
            errors = []
            if "error" in component:
                errors.append(component["error"])
            if "error-verbose" in component:
                errors.append(component["error-verbose"])
            if not errors:
                errors = ["grader command failed"]
            for zucc_part in zucc_component["parts"]:
                print_failed(zucc_part["test"], '\n'.join(errors))
        else:
            for graded_part, zucc_part in zip(component["part-grades"], zucc_component["parts"]):
                score = graded_part["score"]
                grade = float(sum(fractions.Fraction(x) for x in unidecode.unidecode(score).split()))
                if (grade == 1.0):
                    print_passed(zucc_part["test"])
                else:
                    print_failed(zucc_part["test"], graded_part["log"])


main()
