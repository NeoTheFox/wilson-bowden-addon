use <MCAD/involute_gears.scad>

pitch=0.5;// diametral pitch of gear teeth
twistpitch=1;// number of teeth to twist across (can be non-integer)
T=12;// thickness of gears

//ring
union (){
		rotate (a=45,v=[0,0,1]) 
				translate([46.5,0,0])
					difference() {
						rotate (a=45,v=[1,0,0]) 
							cube(size = [1.5,5,5]);
						translate([0,0,3])
							cylinder(r=10,,h=25,$fn=37);
					}
rotate (a=180,v=[1,0,0]) 
difference(){
translate([0,0,-7.125])
difference(){
	union(){
		for(i=[0:3]) {
				rotate (a=90 * i,v=[0,0,1]) 
					translate([43,0,0])
						cylinder(r=5,h=T+2.25,$fn=37);

		}

		hull(){
			cylinder(r=45,h=T+2.25,$fn=37);
			for(i=[0:11]) {
				rotate (a=30 * i,v=[0,0,1]) 
					translate([43,0,0])
						cylinder(r=5,h=T+2.25,$fn=37);

			}
		}
	}
	union(){
		translate([0,0,1.125])
			HBgear(n=37,tol=-.25);
		translate([0,0,1.125])
			mirror([0,0,1])
				cylinder(r=40,h=10,center = false,$fn=37);
		translate([0,0,T+1.125])
			cylinder(r=40,h=10,center = false,$fn=37);
		for(i=[0:11]) {
			rotate (a=30 * i,v=[0,0,1]) 
				translate([43,0,0])
					cylinder(r=1.8,h=T+2.25,$fn=37);


		}
	}
}


cylinder(r=60,h=40,center = false,$fn=37);
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