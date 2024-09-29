# Digital VLSI SoC Design and Planning 
## Section 1 - Inception of open-source EDA, OpenLANE and Sky130 PDK
Tasks: 
  1. Using OpenLANE flow run 'picorv32a' design synthesis and generate necessary outputs.
  2. Calculate the flop ratio:
 
      *Flop Ratio = Number of D Flip Flop / Total Number of Cells*
     
       _Percentage of DFF's = Flop Ratio * 100_.
 
 ### 1.Run 'picorv32a' design synthesis using OpenLANE flow and generate necessary outputs.
 
```
# Directory to invoke the OpqnLANE flow:

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
└── openlane
```
```
# alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21'
# Since we have aliased the long command to 'docker' we can invoke the OpenLANE flow docker sub-system by running:
docker

# Command to invoke the OpenLANE flow in the Interactive mode:
./flow.tcl -interactive

# Input the all required packages for proper functionality of the OpenLANE flow:
prep -design picorv32a

# Design is prepped and ready. Now Run the synthesis:
run_synthesis

```
## Demo Screenshots:

<p align="center">
  <img src="assests/till synthesis/Screenshot 2024-09-25 144211.png" alt=" Pin diagram" width="800">
</p>
<p align="center">
  <img src="assests/till synthesis/Screenshot 2024-09-25 151004.png" alt=" Pin diagram" width="800">
</p>

 ### 2.Calculate the flip flop ratio and DFF %.
```
# Directory for Synthesis report:

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
├── openlane/
├── design/
├── picorv32a/
├── runs/
├── 20-09_18-38/
├── reports/
└── systhesis/

# To see the total number of cells and number of D filp flop enter the given command
less 1-yosys_4.chk.rpt
```
  Synthesis Report file:
  
  <p align="center">
  <img src="assests/till synthesis/Screenshot 2024-09-29 143511.png" width="800">
</p>
  <p align="center">
  <img src="assests/till synthesis/Screenshot 2024-09-25 144439.png" width="800">
</p>
<p align="center">
  <img src="assests/till synthesis/Screenshot 2024-09-25 150146.png" width="800">
</p>

```
# In the above image, the number of cells are:14876
# Number of flip flops are (sky_130_fd_sc_hd__dfxtp): 1613
```
  _Flop Ratio = 1613 / 14876 = 0.1084296853993009_
  
  _Percentage of DFF's = 0.1084296853993009*100 = 10.84296853993009_ %


## Section 2 - Good floorplan vs bad floorplan and introduction to library cells
Tasks: 
  1. Run picorv32a design floorplan using OpenLANE flow.
  2. Calculate the die area in microns from the values in floorplan def.
  3. Load generated floorplan def in magic tool and explore the floorplan.
  4. Run picorv32a design congestion aware placement using OpenLANE flow
  5. Load the generated placement definition in the magic tool and review the placement.

     _Area of die in microns = Die width in microns * Die height in microns_
 ### 1. Use the OpenLANE flow to run the picorv32a design floorplan and produce the required outputs.
Commands to start the OpenLANE flow and execute the floorplanning process.
```
# Directory to invoke the OpenLANE flow:

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
└── openlane

# alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21'
# Since we have aliased the long command to 'docker' we can invoke the OpenLANE flow docker sub-system by running:
docker
```
```
# After entering the Docker sub-system for OpenLANE, we can launch the flow in Interactive mode with the following command.
./flow.tcl -interactive

# With the OpenLANE flow now running, we need to provide the necessary packages for it to function correctly.
package require openlane 0.9

# The OpenLANE flow is now set to run any design. First, we need to prepare the 'picorv32a' design by creating the necessary files and directories.'
prep -design picorv32a

# With the design prepared, we can now run the synthesis using the following command.
run_synthesis

# Now we can run floorplan
run_floorplan
```
Capture an image of the completed floorplan.

 <p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-25 155331.png" width="800">
</p>

### 2. Calculate the die area in microns from the values in floorplan def.
 Capture an image of the contents of the floorplan def.
 
<p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-29 154747.png" width="800">
</p>

  *1000 Unit Distance = 1 Micron*
  
  *Die Width in unit distance = 660685 - 0 = 660685*
  
  *Die Height in unit distance = 671405 - 0 = 671405*
  
  *Distance in microns = Value in Unit Distance / 1000*
  
  *Die width in microns =  660685 / 1000 =660.685*

  *Die height in microns = 671405 / 1000 =671.405*
  
  _Area of Die in microns = 660.685*671.405 = 443587.212425 Square Microns_

### 3. Load generated floorplan def in magic tool and explore the floorplan.
  Instructions to load the floorplan definition in Magic.
  
  ```
# Directory to path containing generated floorplan def.

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
├── openlane/
├── designs/  
├── picorv32a/
├── runs/
├── 25-09_17-43/
├── results/
└── floorplan

# Command to import the floorplan def into the Magic tool.

magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def &
```
Images of the floorplan def displayed in the Magic tool.

<p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-25 174050.png" width="800">
</p>

Equidistant placement of ports and Diogonally equidistant Tap cells

<p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-25 174532.png" width="800">
</p>

Port layer as set through config.tcl

<p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-25 175016.png" width="800">
</p>

Unplaced standard cells at the origin

<p align="center">
  <img src="assests/floorplan/Screenshot 2024-09-29 161841.png" width="800">
</p>

### 4. Load generated floorplan def in magic tool and explore the floorplan.
  Command to run placement
  ```
# Congestion aware placement by default
run_placement
```
Images of placement run

<p align="center">
  <img src="assests/pacement/Screenshot 2024-09-25 203631.png" width="800">
</p>

### 5. Load generated floorplan def in magic tool and explore the floorplan.
Instructions for loading the placement def in Magic from a different terminal.
```
# Navigate to the directory that contains the generated placement def.

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
├── openlane/
├── designs/  
├── picorv32a/
├── runs/
├── 25-09_17-43/
├── results/
└── placement

# Command to load the placement def in magic tool
magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &
```

Images of the floorplan def in the Magic tool.

<p align="center">
  <img src="assests/pacement/Screenshot 2024-09-25 204717.png" width="800">
</p>

Standard cells legally placed

<p align="center">
  <img src="assests/pacement/Screenshot 2024-09-25 211033.png" width="800">
</p>

Commands to exit from current run

```
# Exit from OpenLANE flow
exit

# Exit from OpenLANE flow docker sub-system
exit
```

## Section 3 - Design library cell using Magic Layout and ngspice characterization 
Tasks: 
1. Clone custom inverter standard cell design from github repository: [Standard cell design and characterization using OpenLANE flow.](https://github.com/nickson-jose/vsdstdcelldesign)
2. Import the custom inverter layout into Magic and investigate its features.
3. SPICE extraction of the inverter using the Magic tool.
4. Modifying the SPICE model file for simulation analysis.
5. Post-layout ngspice simulations.
6. Find problem in the DRC section of the old magic tech file for the skywater process and fix them.

```
# Directory to invoke the OpqnLANE flow:

Desktop/
├── work/
├── tools/
├── openlane_working_dir/
└── openlane

# Clone the repository with custom inverter design
git clone https://github.com/nickson-jose/vsdstdcelldesign

# Change into repository directory
cd vsdstdcelldesign

# Copy magic tech file to the repo directory for easy access
cp /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech .

# Verify the contents to ensure that everything is included.
ls

# Command to open custom inverter layout in magic
magic -T sky130A.tech sky130_inv.mag &
```

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 114404.png" width="800">
</p>

### 2. Load the custom inverter layout in magic and explore.
Image of the custom inverter layout displayed in Magic.

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 115420.png" width="800">
</p>

NMOS and PMOS identified

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 212506.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 212634.png" width="800">
</p>

Output Y connectivity to PMOS and NMOS drain verified

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 213526.png" width="800">
</p>

PMOS source connectivity to VDD (here VPWR) verified

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 213656.png" width="800">
</p>

NMOS source connectivity to VSS (here VGND) verified

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 213742.png" width="800">
</p>

### 3. Spice extraction of inverter in magic.

Commands for spice extraction of the custom inverter layout to be used in tkcon window of magic

```
# Check current directory
pwd

# Command to extract data in .ext format.
extract all

# This command activates parasitic extraction prior to converting the .ext file to SPICE format.
ext2spice cthresh 0 rthresh 0

# Converting to ext to spice
ext2spice
```

Screenshot of tkcon window after running above commands

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 215017.png" width="800">
</p>

Screenshot of created spice file

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-26 215159.png" width="800">
</p>

### 4. Editing the spice model file for analysis through simulation.

Measuring unit distance in layout grid

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 094159.png" width="800">
</p>

Final edited spice file ready for ngspice simulation

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 140632.png" width="800">
</p>

### 5. Post-layout ngspice simulations.

Commands for ngspice simulation

```
# Command to directly import the SPICE file for simulation in Ngspice.
ngspice sky130_inv.spice

# Now that we've accessed Ngspice with the simulation SPICE file loaded, we just need to load the plot.
plot y vs time a
```

Images of ngspice run

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 140705.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 140752.png" width="800">
</p>

Images of generated plot

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 140815.png" width="800">
</p>

Rise transition time calculation

*Rise transition time = Time taken for output to rise to 80% - Time taken for output to rise to 20%*

  *20% of Output = 660mV*
  
  *80% of Output = 2.64V*

20% Waveform Images:

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 141629.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 141740.png" width="800">
</p>

80% Waveform Images:

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 142101.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 142126.png" width="800">
</p>

*Rise transition time = 2.24692 - 2.18243 = 0.06449ns = 64.49ps*

Fall transition time calculation

*Fall transition time = Time taken for output to fall to 20% - Time taken for output to fall to 80%*

  *20% of Output = 660mV*
  
  *80% of Output = 2.64V*

20% Waveform Images:

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 142522.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 142726.png" width="800">
</p>

80% Waveform Images:

<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 143431.png" width="800">
</p>
<p align="center">
  <img src="assests/custom inverter standard cell design/Screenshot 2024-09-27 143448.png" width="800">
</p>

*Fall transition time = 4.07806 - 4.05004 = 0.02802ns = 28.02ps*

### 6. Find problem in the DRC section of the old magic tech file for the skywater process and fix them.

Link to Sky130 Periphery rules:https://skywater-pdk.readthedocs.io/en/main/rules/periphery.html

Commands to download and view the corrupted skywater process magic tech file and associated files to perform drc corrections

```
# Home directory
cd

# Command to download the lab files
wget http://opencircuitdesign.com/open_pdks/archive/drc_tests.tgz

# Command to extract the compressed lab file.
tar xfz drc_tests.tgz

# Change directory to lab folder
cd drc_tests

# List all files and directories present in the current directory
ls -al

# Command to view .magicrc file
gvim .magicrc

# Command to open magic tool in better graphics
magic -d XR &
```
Images of commands run

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 151334.png" width="800">
</p>

Image of .magicrc file

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 151632.png" width="800">
</p>

### Incorrectly implemented poly.9 simple rule correction

Incorrectly implemented poly.9 rule no drc violation even though spacing < 0.48u

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 151944.png" width="800">
</p>

Incorrectly implemented poly.9 rule no drc violation even though spacing < 0.48u

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 160001.png" width="800">
</p>
<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 160056.png" width="800">
</p>

New commands added to the sky130A.tech file to refresh the DRC.

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 162115.png" width="800">
</p>
<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 162405.png" width="800">
</p>

Commands to execute in the Tkcon window.

```
# Importing the updated tech file.
tech load sky130A.tech

# It is necessary to re-run the DRC check to view the updated DRC errors.
drc check

# Choosing the area that shows the new errors and retrieving the error messages.
drc why
```

Images of magic window with rule implemente

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 162726.png" width="800">
</p>
<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 171322.png" width="800">
</p>

### Correction of the simple rule for the incorrectly implemented difftap.2.

Incorrectly implemented nwell.4 rule no drc violation even though no tap present in nwell

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 173012.png" width="800">
</p>

New commands have been added to the sky130A.tech file to update the DRC.

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 173631.png" width="800">
</p>
<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 174133.png" width="800">
</p>

Instructions to execute in the Tkcon window.


```
# Importing the revised tech file.
tech load sky130A.tech

# Switch the DRC style to DRC full.
drc style drc(full)

# The DRC check must be re-run to observe the updated DRC errors.
drc check

# Identifying the area that shows the new errors and retrieving the corresponding error messages.
drc why
```

Images of magic window with rule implemented

<p align="center">
  <img src="assests/Find problem in the DRC section/Screenshot 2024-09-27 174242.png" width="800">
</p>



























