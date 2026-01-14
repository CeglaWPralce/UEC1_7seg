# Vivado project configuration file

set project_name sseg_basys3
set top_module top_basys3
set target xc7a35tcpg236-1

set xdc_files {
    constraints/Basys-3-Master.xdc
}

set sv_files {
    ../rtl/counter/counter.sv
    ../rtl/counter/ring_counter.sv
    ../rtl/sseg/sseg.sv
    ../rtl/sseg/sseg_mux.sv
    ../rtl/sseg/hex2sseg.sv
    ../rtl/top.sv   
    rtl/top_basys3.sv 
    
    
    
    
        
        
}
