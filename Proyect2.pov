#include "omarstree.inc"
#include "leonards.inc"
#include "realskies.inc"
#include "colors.inc"

//Sky real 11 
sky_sphere { sky_realsky_11 translate -0.05*y} 
light_source { <5000,5000,-3000>, rgb 1.2 }
light_source { <-5000,2000,3000>, rgb 0.5 shadowless }


camera { location <-7, 10, 150>
         look_at <0, 8, 0> }
//cloud object
#declare Nuve = pigment {
    wrinkles
    turbulence <0.7, 0.4, 1> //editado por Omar
    octaves    7             //editado por Omar
    omega      0.2           //editado por Omar
    lambda     8             //editado por Omar
    color_map {
        [0.00 color rgbt <1.00,1.00,1.00,1.00>]
        [0.50 color rgbt <0.80,1.00,0.80,1.00>]   //editado por Omar
        [0.60 color rgbt <0.50,0.50,0.50,0.50>]
        [1.00 color rgbt <1.00,1.00,1.00,0.00>]
    }
    scale <1200,1200,1200>
} 
//tree Object
#declare tree =
union { 
         object { omarstree_13_stems
                pigment {color rgb <155/255, 114/255, 0/255>} 
         }
         object { omarstree_13_leaves
                texture { pigment {color rgb <97/255, 91/255, 255/255>} 
                          finish { ambient 0.15 diffuse 0.8 }
                          }
         }
         rotate 90*y 
}

//tree 2 Object
#declare tree2 = 
union { 
         object { default_13_stems
                pigment {color rgb <1, .6, .1>} }
         object { default_13_leaves
                texture { pigment { color rgb <1, 0, .7> } 
                          finish { ambient 0.15 diffuse 0.8 }}}
         rotate 90*y 
       }  

//the clouds
union { 
    plane {
        <0, -1, 0> 0
        texture { pigment { Nuve } finish { ambient 1.0 }  }
    }
    plane {
        <0, -1, 0> 0
        translate <0, 5, 0>
        texture { pigment { Nuve } finish { ambient 0.6 }  }
    }
    plane {
        <0, -1, 0> 0
        translate <0, 10, 0>
        texture { pigment { Nuve } finish { ambient 0.8 }  }
    }
    plane {
        <0, -1, 0> 0
        translate <0, 15, 0>
        texture { pigment { Nuve } finish { ambient 0.4 }  }
    }
    translate <0, 1000, 0>
}  

//The declaration of the mountain
#macro maountain(n, x1, y1, x2, y2)
last = 2^n+1
Mat = array[last][last] 
Mat[1][1] = x1
Mat[1][last] = y1
Mat[last][1] = x2
Mat[last][last] = y2
    #for (i, 1 , n, 1)
        N = last - 1
        pos = (N / 2^i)
        #for (j, 1, 2^(i-1), 1)
            #for (k, 1, 2^(i-1), 1)
                //rows
                Mat[(j-1)*2*pos+1][(k-1)*2*pos+1+pos] = 1/2*(Mat[(j-1)*2*pos+1][(k-1)*2*pos+1]+Mat[(j-1)*2*pos+1][k*2*pos+1])
                Mat[j*2*pos+1][(k-1)*2*pos+1+pos] = 1/2*(Mat(j*2*pos+1, (k-1)*2*pos+1)+Mat(j*2*pos+1, k*2*pos+1))
                //columns
                Mat[(j-1)*2*pos+1+pos][(k-1)*2*pos+1] = 1/2*(Mat[(j-1)*2*pos+1][(k-1)*2*pos+1]+Mat[j*2*pos+1][(k-1)*2*pos+1])
                Mat[(j-1)*2*pos+1+pos][k*2*pos+1] = 1/2*(Mat[(j-1)*2*pos+1][k*2*pos+1]+Mat[j*2*pos+1][k*2*pos+1])
                //center
                Mat[(j-1)*2*pos+1+pos][(k-1)*2*pos+1+pos] = 1/4*(Mat[(j-1)*2*pos+1][(k-1)*2*pos+1+pos]+Mat[j*2*pos+1][(k-1)*2*pos+1+pos]
                +Mat[(j-1)*2*pos+1+pos][(k-1)*2*pos+1]+Mat[(j-1)*2*pos+1+pos][k*2*pos+1])
            #end
        #end
    #end 
#end

//the grass plane
plane { <0, 3, 0>, -1
    pigment{ color rgb<0.6,1,0>}
normal { agate 1.0
         agate_turb 2.0 
         scale 0.5 }
}


//trees
object{ tree 
    rotate<0,0,0>
    scale 0.45 
    translate<0,0,100>
}  

object{ tree2 
    rotate<0,0,0>
    scale 1 
    translate<20,0,100>
}  