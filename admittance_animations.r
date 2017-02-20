source("ac_powerflow_lib.r")

animation_steps = 120

steps = seq(0, 2*pi, length.out=animation_steps)

for (i in 1:length(steps)) {
    ac_powerflow(sprintf("admittance_angle_flow/%03d.pdf",i), y_a = -1.45 + steps[i])
    ac_powerloss(sprintf("admittance_angle_loss/%03d.pdf",i), y_a = -1.45 + steps[i])
}


# steps = seq(0, 99, length.out=animation_steps)

# for (i in 1:length(steps)) {
#     ac_powerflow(sprintf("admittance_magnitude_flow/%03d.pdf",i), y_m = 1.0 + steps[i])
#     ac_powerloss(sprintf("admittance_magnitude_loss/%03d.pdf",i), y_m = 1.0 + steps[i])
# }