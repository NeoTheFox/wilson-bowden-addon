use <MCAD/involute_gears.scad>

pitch=0.5;// diametral pitch of gear teeth
twistpitch=1;// number of teeth to twist across (can be non-integer)
T=12;// thickness of gears

difference () {
union () {
	HBgear(11,tol=.25);
	translate([0,0,12]) {
		union() {
			cylinder(r1=8.4,r2=8.5,h=2,center=false,$fs = 0.01);
			translate([0,0,2]) {
				cylinder(r1=8.5,r2=8.5,h=3,center=false,$fs = 0.01);
			}
		}
	}
}
union () {
	translate([0,0,T+5.5]) {	
		mirror([0,0,1]) {
			cylinder(r1=4.6,r2=2.6,h=2,center=false,$fs = 0.01);
		}
	}
	cylinder(r1=2.7,r2=2.7,h=40,center=true,$fs = 0.01);
	for(i=[0:3]) {
		rotate( i*120, [0, 0, 1]) {
			union () {
				translate([0,0,T+2.54])
					rotate (a=-90,v=[0,1,0]) {
						cylinder(r=1.55,h=40,center=false,$fs = 0.01);
					}
				translate([-5,0,29.5])
					cube(size = [2.5,6.4,40], center = true);
				
				}
			}
		}
	}
}

module HBgear(n=20,tol=.25)// herringbone gear
translate([0,0,T/2])
union(){
	gear(number_of_teeth=n,
		diametral_pitch=pitch,
		gear_thickness=T/2,
		rim_thickness=T/2,
		hub_thickness=T/2,
		bore_diameter=0,
		backlash=2*tol,
		clearance=2*tol,
		pressure_angle=20,
		twist=360*twistpitch/n,
		slices=10);
	mirror([0,0,1])
	gear(number_of_teeth=n,
		diametral_pitch=pitch,
		gear_thickness=T/2,
		rim_thickness=T/2,
		hub_thickness=T/2,
		bore_diameter=0,
		backlash=2*tol,
		clearance=2*tol,
		pressure_angle=20,
		twist=360*twistpitch/n,
		slices=10);
}