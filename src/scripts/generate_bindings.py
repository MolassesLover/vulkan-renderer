#!/bin/python3

# region Modules

import argparse
import os
import subprocess

# endregion

# region Functions


def GenerateBindings():
    print(f"Generating bindings for {arguments.language}")
    subprocess.run(
        f"cd ../bindings; swig -{arguments.language} -c++ -o vkRenderer_{arguments.language}.cpp  TEMPORARYNAMELIB.i",
        shell=True,
    )


# endregion

if __name__ == "__main__":
    argumentParser = argparse.ArgumentParser()
    argumentParser.add_argument("--language", "-l", type=str)
    arguments = argumentParser.parse_args()

    GenerateBindings()
