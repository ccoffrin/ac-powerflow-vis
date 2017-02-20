source("ac_powerflow_lib.r")

animation_steps = 120

steps = seq(-0.2, 0.2, length.out=animation_steps/2)

for (i in 1:length(steps)) {
    ac_powerflow(sprintf("voltage_magnitude_flow/%03d.pdf",i), v_fr = 1.0 + steps[i])
    ac_powerloss(sprintf("voltage_magnitude_loss/%03d.pdf",i), v_fr = 1.0 + steps[i])
}

rev_steps = rev(steps)
for (i in 1:length(steps)) {
    ac_powerflow(sprintf("voltage_magnitude_flow/%03d.pdf",i+length(steps)), v_fr = 1.0 + rev_steps[i])
    ac_powerloss(sprintf("voltage_magnitude_loss/%03d.pdf",i+length(steps)), v_fr = 1.0 + rev_steps[i])
}
