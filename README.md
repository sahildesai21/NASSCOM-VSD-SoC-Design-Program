# Digital VLSI SoC Design and Planning 
## Section 1 - Inception of open-source EDA, OpenLANE and Sky130 PDK
Task 1: 
  1. Using OpenLANE flow run 'picorv32a' design synthesis and generate necessary outputs.
  2. Calculate the flop ratio:
 
      *Flop Ratio = Number of D Flip Flop / Total Number of Cells*
     
       _Percentage of DFF's = Flop Ratio * 100_.
 
 ### 1.Run 'picorv32a' design synthesis using OpenLANE flow and generate necessary outputs.
 **Directory to invoke the OpqnLANE flow.**
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
## Demo Screenshots:
<p align="center">
  <img src="assests/Screenshot 2024-09-21 001212.png" alt=" Pin diagram" width="800">
</p>
<p align="center">
  <img src="assests/Screenshot 2024-09-21 002510.png" alt=" Pin diagram" width="800">
</p>
<p align="center">
  <img src="assests/Screenshot 2024-09-21 003936.png" width="800">
</p>

 ### 2.Calculate the flip flop ratio and DFF %.
 **Directory for Synthesis report:**
```
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
```
```
#To see the total number of cells and number of D filp flop enter the given command
less 1-yosys_4.chk.rpt
```
  Synthesis Report file:
  <p align="center">
  <img src="assests/Screenshot 2024-09-22 124140.png" width="800">
</p>
<p align="center">
  <img src="assests/Screenshot 2024-09-22 132315.png" width="800">
</p>

```
#In the above image, the number of cells are:14876
#Number of flip flops are (sky_130_fd_sc_hd__dfxtp): 1613
```
  _Flop Ratio = 1613 / 14876 = 0.1084296853993009_
  
  _Percentage of DFF's = 0.1084296853993009*100 = 10.84296853993009_ %

