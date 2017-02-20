source("ac_powerflow_lib.r")

animation_steps = 120

# steps = seq(0, 2*pi, length.out=animation_steps)

# for (i in 1:length(steps)) {
#     ac_powerflow(sprintf("transformer_angle_flow/%03d.pdf",i), y_a = -pi/2, t_a = 0.0 + steps[i])
#     ac_powerloss(sprintf("transformer_angle_loss/%03d.pdf",i), y_a = -pi/2, t_a = 0.0 + steps[i])
# }


steps = seq(-0.8, 0.8, length.out=animation_steps/2)

for (i in 1:length(steps)) {
    ac_powerflow(sprintf("transformer_magnitude_flow/%03d.pdf",i), y_a = -pi/2, t_m = 1.0 + steps[i])
    ac_powerloss(sprintf("transformer_magnitude_loss/%03d.pdf",i), y_a = -pi/2, t_m = 1.0 + steps[i])
}

rev_steps = rev(steps)
for (i in 1:length(steps)) {
    ac_powerflow(sprintf("transformer_magnitude_flow/%03d.pdf",i+length(steps)), y_a = -pi/2, t_m = 1.0 + rev_steps[i])
    ac_powerloss(sprintf("transformer_magnitude_loss/%03d.pdf",i+length(steps)), y_a = -pi/2, t_m = 1.0 + rev_steps[i])
}
