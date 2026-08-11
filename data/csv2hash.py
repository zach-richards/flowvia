# csv2hash.py
# This script reads a CSV file and converts it into a hash format.

import csv
import os
import argparse

def csv_to_hash(csv_file):
    if not csv_file.endswith('.csv'):
        raise ValueError("The provided file is not a CSV file.")

    if not os.path.exists(csv_file):
        raise FileNotFoundError(f"The file {csv_file} does not exist.")

    print(f"Converting {csv_file} to hash format...")

    output_dir = "../src/user_track/windows/context"

    os.makedirs(output_dir, exist_ok=True)

    filename = os.path.basename(csv_file).replace(".csv", "_hash.c")

    output_file = os.path.join(output_dir, filename)

    with open(csv_file, newline="") as csvfile:
        reader = csv.DictReader(csvfile)

        with open(output_file, "w") as file:
            file.write(f'// {output_file}\n')
            file.write(f'// Hash table generated from {csv_file}\n\n')

            file.write('#include <user_track/windows/context/hash.h>\n\n')

            s = output_file.replace(".c", "") # Take out .c from the function name
            s = s[0].upper() + s[1:] # capitalize first letter of the string
            file.write(f'void import_{s}(const char* key, const char* value) {{\n')
            for row in reader:
                file.write(
                    f'  addHash("{row["key"]}", "{row["value"]}");\n'
                )

            file.write("\n  // End of hash table\n")
            file.write("}")

    print(f"Hash file created: {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert CSV files into C hash table entries"
    )

    parser.add_argument(
        "input",
        help="CSV file to convert"
    )

    args = parser.parse_args()

    csv_to_hash(args.input)