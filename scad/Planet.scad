use <MCAD/involute_gears.scad>

pitch=0.5;// diametral pitch of gear teeth
twistpitch=1;// number of teeth to twist across (can be non-integer)
T=12;// thickness of gears

HBgear(13,tol=.25);

module HBgear(n=20,tol=.25)// herringbone gear
translate([0,0,T/2])
union(){
	difference() {
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
		union() {
			cylinder(r1=6,r2=8.25,h=1,center=false,$fs = 0.01);
			translate([0,0,3.5])
			cylinder(r=8.25,h=5,center=true,$fs = 0.01);
		}
	}
	mirror([0,0,1])
	difference() {
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
		union() {
			cylinder(r1=6,r2=8.25,h=1,center=false,$fs = 0.01);
			translate([0,0,3.5])
			cylinder(r=8.25,h=5,center=true,$fs = 0.01);
		}
	}
}