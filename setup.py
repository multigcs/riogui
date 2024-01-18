#!/usr/bin/env python3
#
# ls data/* | awk '{print "\""$1"\""}' | tr "\n" ","
#

import glob
import os

from setuptools import setup

VERSION = "0.0.4"

scripts = []
package_data = {}
packages = []

for script in glob.glob("bin/*"):
    scripts.append(script)

setup(
    name="riogui",
    version=VERSION,
    author="Oliver Dippel",
    author_email="o.dippel@gmx.de",
    packages=packages,
    package_data=package_data,
    scripts=scripts,
    url="https://github.com/multigcs/LinuxCNC-RIO/",
    license="LICENSE",
    description="riogui",
    long_description=open("README.md").read(),
    install_requires=["riocore>=0.0.4", "PyQt5>=5.15", "graphviz>=0.20"],
    include_package_data=True,
)
