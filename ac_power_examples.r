source("ac_powerflow_lib.r")

ac_powerflow("ac_powerflow_transmission.pdf")
ac_powerloss("ac_powerloss_transmission.pdf")

ac_powerflow("ac_powerflow_distribution.pdf", y_a = -0.785398)
ac_powerloss("ac_powerloss_distribution.pdf", y_a = -0.785398)
