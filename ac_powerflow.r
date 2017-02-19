vhi = 1.2
vlow = 0.8

ahi = pi/6
alow = -pi/6

g=0.2
b=-1

steps = 100

vvalues = seq(vlow, vhi, (vhi-vlow)/(steps-1))
avalues = seq(alow, ahi, (ahi-alow)/(steps-1))

#print(vvalues)
#print(avalues)

#for(t in c(0, 0.1309)){
#  for(v1 in c(1.1,1.0,0.9)){
#    for(v2 in c(1.1,1.0,0.9)){
#      val = v1*v2*cos(t) - v1*v1
#      print(c(v1, v2, t, val))
#    }
#  }
#}

pv = matrix(nrow = steps, ncol = steps)
qv = matrix(nrow = steps, ncol = steps)

for (i in 1:steps) {
	for (j in 1:steps) {
	  v1 = 0.8;
	  v2 = vvalues[i];
	  a = avalues[j];
		
		pv[i,j] = (v1**2-v1*v2*cos(a))*g + (-v1*v2*sin(a))*b
		qv[i,j] = (-v1*v2*sin(a))*g + (-v1^2+v1*v2*cos(a))*b
	}
}

#print(tv);

#maxval = max(max(tv),-min(tv))
#print(maxval)
#colorsteps = seq(-maxval, maxval, steps)
#print(colorsteps)

#heatmap(tv, Rowv=NA, Colv=NA, col=heat.colors(256))
#heatmap(av, Rowv=NA, Colv=NA, col=heat.colors(256))
#heatmap(tv, Rowv=NA, Colv=NA, col=heat.colors(256))

#plot3d(x=1:steps, y=1:steps, av)
#persp(values, values, tv, theta=20)
#persp(values, values, av, theta=20)

ps = 14

fileName = "activeField.pdf"
pdf(fileName, pointsize=ps, width=7, height=7)
contour(x = vvalues,
               y = avalues,
               pv,
               #color = terrain.colors,
               #levels = colorsteps,
               nlevels = 10,
               labcex=1.0,
               plot.title = title(main = "Active Power Field",
               xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
               )
dev.off()


fileName = "reactiveField.pdf"
pdf(fileName, pointsize=ps, width=7, height=7)
contour(x = vvalues,
               y = avalues,
               qv,
               #color = terrain.colors,
               #levels = colorsteps,
               nlevels = 15,
               labcex=1.0,
               plot.title = title(main = "Reactive Power Field",
               xlab = "Voltage Difference", ylab = "Angle Difference (rad)")
               )
dev.off()