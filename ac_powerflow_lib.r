
ac_powerflow = function(
     file_name, 
     v_fr = 1.0, v_to = 1.0,
     vd_ub = 0.2, vd_lb = -0.2,
     ad_ub = pi/6, ad_lb = -pi/6,
     y_m = 1.0, y_a = -1.45,
     t_m = 1.0, t_a = 0.0
     ) {

     g =  y_m*cos(y_a)
     b = y_m*sin(y_a)

     steps = 100

     vd_vals = seq(vd_lb, vd_ub, (vd_ub-vd_lb)/(steps-1))
     ad_vals = seq(ad_lb, ad_ub, (ad_ub-ad_lb)/(steps-1))

     pv = matrix(nrow = steps, ncol = steps)
     qv = matrix(nrow = steps, ncol = steps)

     for (i in 1:steps) {
          for (j in 1:steps) {
               v1 = v_fr;
               v2 = v_to + vd_vals[i];
               ad = ad_vals[j];

               pv[i,j] =  g*v1^2/t_m^2 - g*v1/t_m*v2*cos(ad - t_a) - b*v1/t_m*v2*sin(ad - t_a)
               qv[i,j] = -b*v1^2/t_m^2 + b*v1/t_m*v2*cos(ad - t_a) - g*v1/t_m*v2*sin(ad - t_a)
          }
     }

     ps = 14
     pdf(file_name, pointsize=ps, width=14, height=7, bg="white")

     #attach(mtcars)
     par(mfrow=c(1,2), oma=c(0,0,2.5,0)) 

     contour(
          x = vd_vals,
          y = ad_vals,
          pv,
          #color = terrain.colors,
          #levels = colorsteps,
          nlevels = 8,
          labcex=1.0,
          plot.title = title(main = "Active Power (p)",
          xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
     )

     contour(
          x = vd_vals,
          y = ad_vals,
          qv,
          #color = terrain.colors,
          #levels = colorsteps,
          nlevels = 8,
          labcex=1.0,
          plot.title = title(main = "Reactive Power (q)",
          xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
     )

     title("AC Power Flow Fields (from side, p.u.)", outer=TRUE)
     mtext(
          sprintf("v1 = %.3f, g = %.3f, b = %.3f, tr = %.3f, as = %.3f", v_fr, g, b, t_m, t_a), 
          line=-1, outer=TRUE)

     dev.off()
}



ac_powerloss = function(
     file_name, 
     v_fr = 1.0, v_to = 1.0,
     vd_ub = 0.2, vd_lb = -0.2,
     ad_ub = pi/6, ad_lb = -pi/6,
     y_m = 1.0, y_a = -1.45,
     t_m = 1.0, t_a = 0.0
     ) {

     g =  y_m*cos(y_a)
     b = y_m*sin(y_a)

     steps = 100

     vd_vals = seq(vd_lb, vd_ub, (vd_ub-vd_lb)/(steps-1))
     ad_vals = seq(ad_lb, ad_ub, (ad_ub-ad_lb)/(steps-1))

     pv_fr = matrix(nrow = steps, ncol = steps)
     qv_fr = matrix(nrow = steps, ncol = steps)

     pv_to = matrix(nrow = steps, ncol = steps)
     qv_to = matrix(nrow = steps, ncol = steps)

     for (i in 1:steps) {
          for (j in 1:steps) {
               v1 = v_fr;
               v2 = v_to + vd_vals[i];
               ad = ad_vals[j];

               pv_fr[i,j] =  g*v1^2/t_m^2 - g*v1/t_m*v2*cos(ad - t_a) - b*v1/t_m*v2*sin(ad - t_a)
               qv_fr[i,j] = -b*v1^2/t_m^2 + b*v1/t_m*v2*cos(ad - t_a) - g*v1/t_m*v2*sin(ad - t_a)

               pv_to[i,j] =  g*v2^2 - g*v1/t_m*v2*cos(ad + t_a) - b*v1/t_m*v2*sin(ad + t_a)
               qv_to[i,j] = -b*v2^2 + b*v1/t_m*v2*cos(ad + t_a) - g*v1/t_m*v2*sin(ad + t_a)
          }
     }

     ps = 14
     pdf(file_name, pointsize=ps, width=14, height=7, bg="white")

     #attach(mtcars)
     par(mfrow=c(1,2), oma=c(0,0,2.5,0)) 

     contour(
          x = vd_vals,
          y = ad_vals,
          pv_fr + pv_to,
          #color = terrain.colors,
          #levels = colorsteps,
          nlevels = 8,
          labcex=1.0,
          plot.title = title(main = "Active Power (p)",
          xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
     )

     contour(
          x = vd_vals,
          y = ad_vals,
          qv_fr + qv_to,
          #color = terrain.colors,
          #levels = colorsteps,
          nlevels = 8,
          labcex=1.0,
          plot.title = title(main = "Reactive Power (q)",
          xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
     )

     title("AC Power Loss Fields (p.u.)", outer=TRUE)
     mtext(
          sprintf("v1 = %.3f, g = %.3f, b = %.3f, tr = %.3f, as = %.3f", v_fr, g, b, t_m, t_a), 
          line=-1, outer=TRUE)

     dev.off()
}