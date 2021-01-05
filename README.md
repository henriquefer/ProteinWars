# ProteinWars
A drug/protein game for VMD

# Pre-Requirments
ProteinWars requires Visual Molecular Dynamics (VMD) 1.9.3 or later.
Protein Wars was only tested on macOS and Linux (Ubuntu) machines.

## macOS
For macOS, please install **sox** and **cliclick** software.

They can be easily installed via Brew:

`brew install sox`

`brew install cliclick`

## Linux
For Linux, please install **sox** and **xdotool** software.

They can be easily installed via apt-get:

`apt-get install sox xdotool`

# Installation
Please, add the following lines to your .vmdrc file, changing the installation path ("/PATH/proteinWars") to the respective on on your machine:
```
lappend auto_path "/PATH/proteinWars"
vmd_install_extension vmdGame "vmdGame::start" "VMD Store/Protein Wars"
```

Please, edit the `proteinWars.tcl` file to change the value of the `Directory` variable. It should match the installation path of your ProteinWars.

`		variable Directory		"/PATH/proteinWars"`
