# LoLA - A Low Level Petri Net Analyzer

LoLA is a tool that can check whether a system (given as Petri net) satisfies a specified property. The property is evaluated by exhaustive and explicit exploration of a reduced state space. LoLA uses a broad range of state-of-the-art reduction techniques most of which can be applied jointly. Hence, LoLA typically needs to explore only a tiny fraction of the actual state space. The particular strength of LoLA is the evaluation of simple properties such as deadlock freedom or reachability. Here, additional reduction techniques and specialized variants of techniques are applied.

## Purpose of this repo

This is an unofficial mirror of the code for the model checker used in [granite](https://github.com/hlisdero/granite/).
In case the download links stop working, it is crucial that the model checker is still available somewhere else.

## Installation

1. Install Kimwitu++ compiling it from the source. Follow the instructions in the [INSTALL](./kimwitu++/INSTALL) file.

2. Install all the other dependencies of LoLA. These are usually available through the package manager of Linux distros.
  
    * Autoconf
    * Automake
    * Flex
    * GNU Bison
    * GNU Gengetopt
    * GNU Make
    * GNU help2man
    * GNU sed (for Mac OS X user: default sed may cause problems, GNU sed needed)

3. Install LoLA compiling it from the source. Follow the instructions in the [README](./lola/README).
The code needs to be modified for the compilation to work. See the corresponding [commit](https://github.com/hlisdero/lola/commit/fe5323ccf1584622517fbeef1feeaa743494fa3b).

These steps were tested on a Fedora Linux 38 (Workstation Edition) 64-bit machine.

## License

LoLA is published under the GNU Affero General Public License. See [COPYING](./lola/COPYING).

Kimwitu++ is published under the GNU General Public License version 2 or later. See [LICENSE](./kimwitu%2B%2B/LICENCE)

## Acknowledgments

[Authors of LoLA](./lola/AUTHORS). This is version 2.0 of LoLA which involved a complete rewrite.

The BibTeX citation for the original paper where LoLA was presented is:

```bibtex
@inproceedings{schmidt2000lola,
  title={Lola a low level analyser},
  author={Schmidt, Karsten},
  booktitle={Application and Theory of Petri Nets 2000: 21st International Conference, ICATPN 2000 Aarhus, Denmark, June 26--30, 2000 Proceedings 21},
  pages={465--474},
  year={2000},
  organization={Springer}
}
```

Original source of the LoLA code: <https://theo.informatik.uni-rostock.de/theo-forschung/tools/lola/>

Original source of the Kimwitu++ code: <https://www.nongnu.org/kimwitu-pp/>
