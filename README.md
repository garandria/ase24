# PyroBuildS: Speeding Up the Exploration of Large Configuration Spaces with Incremental Build (Artifact)

## Abstract

Software developers are acutely aware that software build is an essential but
resource-intensive step in any software development process, all the more when
building large and/or highly configurable systems, whose vast number of
configuration options leads to an explosion in the number of variants to build
and evaluate.
A potential approach to speed up the builds of multiple configurations is to do
_incremental build_, i.e., to not clean the build environment and reuse previous
builds when building a new configuration.
Previous exploratory studies showed some benefits and limitations of incremental
build, but mainly on small configurable software systems, on a limited set of
close configurations.
However, _for large configuration spaces_, little is known whether the large
distance across configurations impacts the correctness and efficiency of
incremental build.
This paper presents PYROBUILDS, _a new approach to speed up incremental builds_
while keeping reproducibility, featuring a configuration variation operator
parameterized by two deny lists of problematic options and a mutation size
(diversity).
We evaluate PYROBUILDS through an empirical study on three large complex
configurable systems, namely Linux, BusyBox, and ToyBox, with respectively
18637, 1078, 330 configuration options.
We first show that for all configurations PYROBUILDS produces the exact same
binaries as a clean build, except for Linux with some non-reproducible random
configurations.
We identify the reasons why incremental build speeds up or slows down the build
of large configuration spaces -- a knowledge that can be integrated into
PYROBUILDS.
Incremental build systematically pays off, since problematic options are avoided
in the first place -- something only PYROBUILDS does. We also show that a
_naive_ use of incremental build on random Linux configurations backfires,
taking more time than clean builds. Thus, PYROBUILDS controls diversity to avoid
too many differences across configurations to perform efficient incremental
builds.
Thanks to its ability to operate over non-problematic options and close enough
configurations, PYROBUILDS significantly speeds up the exploration of large
configuration spaces, with a gain in build time from 16% to 22% in all three
systems with mutated configurations.
Finally, with random configurations, PYROBUILDS also speeds up the build time
from 15% to 20% for ToyBox and BusyBox.


## About this repository

This repostitory contains the following artefact for each subject system of the
paper:
- configurations
- build results
- notebook to visualize the data.


## Run the notebook

You need to install pip first then run the pip commands in
_pip.requirements_. Then, just run the notebook with the following command
`jupyter notebook` and access to the Data.ipynb notebook.
