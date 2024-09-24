# Repository for the FSE #791 submission
# PyroBuildS: Speeding Up the Exploration of Large Configuration Spaces with Incremental Build

## Abstract

Software developers are acutely aware that software build is an essential but
resource-intensive step in any software development process, all the more when
building large and/or highly configurable systems, whose vast number of
configuration options leads to an explosion in the number of variants to build
and evaluate. A potential approach to speed up the builds of multiple
configurations is to do incremental build, ie to not clean the build environment
and reuse previous builds when building a new configuration. Previous
exploratory studies showed some benefits and limitations of incremental build,
but mainly on small configurable software systems, on a limited set of close
configurations. However, for large configuration spaces, little is known whether
the large distance across configurations impacts the correctness and efficiency
of incremental build. This paper presents PyroBuildS, a new approach to speed up
incremental builds while keeping reproducibility, featuring a configuration
variation operator parameterized by two deny lists of problematic options and a
mutation size (diversity). We evaluate PyroBuildS through an empirical study on
three large complex configurable systems, namely Linux, BusyBox, and ToyBox,
with respectively 18637, 1078, 330 configuration options. We first show that for
all configurations PyroBuildS produces the exact same binaries than a clean
build, except for Linux with some non-reproducible random configurations. We
identify the reasons why incremental build speeds up or slows down the build of
large configuration spaces – knowledge that can be integrated into
PyroBuildS. Incremental build systematically pays off, since problematic options
are avoided in the first place – something only PyroBuildS does. We also show
that a naive use of incremental build on random Linux configurations backfires,
taking more time than clean builds. Thus, PyroBuildS controls diversity to avoid
too many differences across configurations to perform efficient incremental
builds. Thanks to its ability to operate over non-problematic options and close
enough configurations, PyroBuildS significantly speeds up the exploration of
large configuration spaces, with a gain in build time from 1616 to 2222 in all
three systems with mutated configurations. Finally, with random configurations,
PyroBuildS also speeds up the build time from 1515 to 2020 for ToyBox and
BusyBox.


## About this repository

This repostitory contains the following artefact for each subject system of the
paper:
- configurations
- build results
- notebook to visualize the data.
