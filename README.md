# Digital VLSI SoC Design and Planning 
## Section 1 - Inception of open-source EDA, OpenLANE and Sky130 PDK
Task 1: 
  1. Using OpenLANE flow run 'picorv32a' design synthesis and generate necessary outputs.
  2. Calculate the flop ratio.  $Flop Ratio={Number of D Flip Flop}/{Total Number of Cells}$
     $Percentage of DFF's= {Flop Ratio}*{100}$.
 
  **1.Run 'picorv32a' design synthesis using OpenLANE flow and generate necessary outputs.**
### Directory to invoke the OpqnLANE flow.
```
Desktop/
├── work/
├── tools/
├── openlane_working_dir/
└── openlane/
```
```
# alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21'
# Since we have aliased the long command to 'docker' we can invoke the OpenLANE flow docker sub-system by running:
docker
```
```
#Command to invoke the OpenLANE flow in the Interactive mode:
./flow.tcl -interactive

#Input the all required packages for proper functionality of the OpenLANE flow:
prep -design picorv32a

#Design is prepped and ready. Now Run the synthesis:
 run_synthesis
```
# Demos Screenshots
<p align="center">
  <img src="" alt=" Pin diagram" width="800">
</p>
