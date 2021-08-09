

holder_tickness  = 1.5;

holder_width_int = 19; //mm
holder_width_ext =holder_width_int + 2*holder_tickness; //mm

holder_length_int = 73; //mm
holder_length_ext = holder_length_int+ 2*holder_tickness; //mm

/*same heigh but interior box is offset holder_tickness*/
holder_height_int  = 15;
holder_height_ext  = 15+ holder_tickness;

batt_length = 65; //mm
batt_width  = 18; //mm

/*Battey 18650*/
bat_length = 65;
bat_width = 18;

contact_pin_diameter =11;

module battery_model(width,length,high){
    rotate ([0,90,0])
    cylinder( 66 , d=width);

}
module battery_cut(width,length,high,tickness){
    translate([-tickness-1,0,0])
    cube([length+2+2*tickness,width,high]);
}

module battery_body(width,length,height){
color("red")
cube([length,width,height]);
}


module battery_box(width, length,height,tickness){

    difference()
    {
    
        battery_body(width+ (2*tickness),
             length + (2*tickness),
             height + (tickness));
        translate( [tickness  ,
                    tickness,
                    tickness])
        battery_cut(width,
                    length,
                    height+tickness,
        tickness);
    }
}


module battery_contact_holder(width, length,height,tickness, contact_d){

    difference(){//pin connector slot
    difference()
    {
    difference()
    {
    difference(){
    {
        color("green")
        translate([0,0,0])
        cube([2*tickness,width+2*tickness,height]);
     //   color("blue")
       // translate([length,0,0])
        //cube([2*tickness,width+2*tickness,height]);
    }
       translate([tickness,((2*tickness+width)-(contact_d+1))/2,tickness])
       cube([tickness+1,contact_d+1,height+1]);
    
    }
    color("red")
       translate([tickness,tickness-(1/2),tickness-1])
       cube([tickness/2,width+1,height+1]);
    }
    color("white");
       translate([-tickness,((2*tickness+width)-6)/2,height-2])
       cube([3,6,2]);
    }
       color("white");
       translate([-tickness,((2*tickness+width)-6)/2,height-8])
       cube([2,6,8]);
    }


}


/*******************************************************/


/*Places battery inside the battery holder*/


/*translate([(holder_length_int+ (holder_tickness)-bat_length)/2,holder_tickness+holder_width_int/2,holder_tickness+bat_width/2])
battery_model(bat_width,bat_length,holder_tickness);
*/

/*Draw the Enclosure*/
module battery_holder_full(){

difference(){//bottom cylinders
difference(){//top square len part
difference(){//cylinder middle len
difference(){//contact borders

battery_box(holder_width_int  ,
            holder_length_int ,
            holder_height_int ,
            holder_tickness)  ;
    {
    cube([2*holder_tickness,holder_width_int+1+2*holder_tickness,holder_height_ext+1]);
    translate([holder_length_int,0,0])
    cube([2*holder_tickness,holder_width_int+1+2*holder_tickness,holder_height_ext+1]);
    }
}
    translate([holder_length_int/2,0,(holder_height_ext/2)+holder_length_int/5])
    rotate([0,90,90])
    cylinder( 80, d=holder_length_int/2);

}
    translate([holder_tickness*2 +4,0,holder_height_int-4])
//    rotate([0,45,0])
    cube([holder_length_int-8-holder_tickness-holder_tickness,holder_width_ext,holder_height_int]);    
    }
    {
    translate([holder_length_int/3 - 12/4 ,
        12/4 +holder_width_int/2 - holder_tickness,
        10])
    rotate([0,180,90])
    {
        cylinder( 80, d=12);
        translate([0,-12-6,0])
        cylinder( 80, d=12);
        translate([0,-12-12-12,0])        
        cylinder( 80, d=12);

    }
    }
}
battery_contact_holder(holder_width_int  ,
          holder_length_int ,
        holder_height_ext ,
      holder_tickness,
    contact_pin_diameter)  ;

translate([holder_length_int+holder_tickness*2,holder_width_int+2*holder_tickness,0])
rotate([0,0,180])
battery_contact_holder(holder_width_int  ,
          holder_length_int ,
        holder_height_ext ,
      holder_tickness,
    contact_pin_diameter)  ;

}


battery_holder_full();
/*Battery snap part*/

/*
//    difference(){
    difference(){
    {    color("white")
    translate([holder_tickness*2 +5,
                holder_tickness,
                holder_height_int-8])
    rotate([0,-45,0])
    cube([4,
          holder_width_int+2,
          5.5+2]);    
    }
    {
    translate([holder_tickness*2+5,
           (holder_width_int-bat_width)/2 +holder_tickness,
            holder_height_int-8])
    rotate([0,-45,0])
    color("pink")
    cube([4,
          bat_width,
          5.5+3]);    
    }
    }
    */
    
//    translate([(holder_length_int+ (holder_tickness)-bat_length)/2,holder_tickness+holder_width_int/2,holder_tickness+//bat_width/2])
    //battery_model(bat_width,bat_length,holder_tickness);

  //  }


/*   
color("gray")
    translate([holder_tickness*2,0,holder_height_int-4])
    cube([holder_length_int-holder_tickness-holder_tickness,holder_width_ext,holder_height_int]);
*/

