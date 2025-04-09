# The Scoop source code reconstruction using LLMs

This is a work in progress project to reconstruct the source code for the MS-DOS version of the Microprose game ["The Scoop"](https://www.mobygames.com/game/4795/the-scoop/). The original game was written in C. The C source code was compiled with the Microsoft C compiler v5.0 and it uses the [compact memory model](https://en.wikipedia.org/wiki/X86_memory_models).

The reconstruction aims to be bug-for-bug faithful, and the C routines yield code that's identical to the original at the CPU instruction level (when compiled with the same compiler with appropriate flags), while allowing for layout differences in the executables.

This is just the reconstruction project; porting to a modern OS, potential improvements and bugfixes will be targeted by a separate project in the future.

This repository contains no game assets, executables or other copyrighted material, it's a clean rewrite of the game's source code based on the analysis of the game binaries obtained from the original floppy disks, for preservation and historical research purposes, and as such should fall under the interoperability exemption of the DMCA.

The general idea of doing a source code reconstruction and most of the scripts were based on [the excelent F-15 Strike Eagle 2 reconstruction](https://github.com/neuviemeporte/f15se2-re). Very recommended to take a look there if you want to see a professional (and advanced!) reconstruction project.

The main difference betweeh the f15se2-re project and this reconstruction is the experimentation using LLMs to iterate on the C code until to make the process scalable.

# Executable

The game executable is compressed using EXEPack. The sha256 signatures are:

* `34f8a654a3c46095d48dcc76ecf088cb90655972794b8ecb4d87927f5a295b9b  game/SCOOP.EXE`
* `343320c1a103729df3d69bebf887f1c5d3c9bf38890ff3ec6ec4d515c40d9b5b  game/SCOOP.EXE` (unpackad using [unEXEPack](https://github.com/w4kfu/unEXEPACK))

# Status

As of the time of writing this, the reconstruction has not started yet. We are just testing the technology to see if it works and setting up the initial scripts to automatically compile the complete binary and compare it with the original one. It is unclear if the technology is good enough, but some results are promising. Check the [src/recovered] folder to see examples of reconstructed functions.

# Building

Prerequisites:

* a copy of the MS C v5.0 compiler placed in the `dos/msc5` directory
* the `dosbox` emulator has been installed
* relatively recent (3.8-ish) Python installed

Instructions are WIP, but the idea is to clone the project and run `make` inside. It will download and build the `mzretools` and `UASM` repositories as part of the build process. The build process is not complete yet and it is still a copy of the f15se2-re one.

# Verification

The Makefile contains a target for automatically comparing the reconstruction with the original using the `mzdiff` tool but the verification is not ready to work.