
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name calculator -dir "D:/abDATA/PLD/calculator/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/abDATA/PLD/calculator/calculator.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/abDATA/PLD/calculator} }
set_property target_constrs_file "calculator.ucf" [current_fileset -constrset]
add_files [list {calculator.ucf}] -fileset [get_property constrset [current_run]]
link_design
