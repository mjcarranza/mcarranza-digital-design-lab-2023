transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/DivisionNBit.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/shiftRight.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/shiftLeft.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/CompuertaXOR.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/CompuertaOR.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/CompuertaAND.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/Suma1Bit.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/Restador1Bit.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/SumaNBit.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/RestadorNBit.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/aluModos.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/decodificador_modos.sv}
vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/MulNBit.sv}

vlog -sv -work work +incdir+C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3 {C:/Users/maxta/Documents/GitHub/mcarranza-digital-design-lab-2023/Laboratorio3/Suma1Bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Suma1Bit_tb

add wave *
view structure
view signals
run -all
