#!/usr/bin/env python3
#
# ls data/* | awk '{print "\""$1"\""}' | tr "\n" ","
#

import os
import glob
from setuptools import setup
from riocore.VERSION import VERSION

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
    install_requires=["riocore", "PyQt5"],
    include_package_data=True,
)

