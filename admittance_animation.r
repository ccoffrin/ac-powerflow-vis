source("ac_powerflow_lib.r")

animation_steps = 120

steps = seq(0, 2*pi, length.out=animation_steps)

for (i in 1:length(steps)) {
    ac_powerflow(sprintf("admittance_flow_animation/%03d.pdf",i), y_a = -1.45 + steps[i])
    ac_powerloss(sprintf("admittance_loss_animation/%03d.pdf",i), y_a = -1.45 + steps[i])
}