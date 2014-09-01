vlog -vopt test_flops.sv
vopt test_flops -o test_flops_opt
vsim test_flops_opt
run -all
