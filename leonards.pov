//Leonardo Gutierrez
//A01089731


#include "leonards.inc"     
#include "realskies.inc"
#include "colors.inc" 

//background {rgb <0,.5,.5>} 

sky_sphere { sky_realsky_10 translate -0.05*y}
                                             
plane { <0, 1, 0>, 0
    texture {
   pigment {
     granite
     turbulence 3
     color_map {
       [0.000 color rgb <0.5, 0.5, 0.2>]
       [0.25 color rgb <0.7, 1, 0.2>]
     }
     scale 0.035
   }
   finish{specular .25 }
           normal{
             average normal_map{
                 [0.0 bumps 150 scale 30]
                 [0.2 dents 50 scale 12.5 turbulence .3]
                 [0.6 bump_map{ gif "GBM4.gif" bump_size 50} rotate x*90
 rotate y*45 scale 30 ]
                 [1.0 wrinkles 25 scale 5 scallop_wave rotate z*30]
                 }//end of normal map
                 rotate z*15 turbulence .4
               }//end of normal dec
 }
  }                                             
                                             
light_source { <5000,5000,-3000>, rgb 1.2 }
light_source { <-5000,2000,3000>, rgb 0.5 shadowless }

camera { location <-7, 1, 10>
         look_at <0,3,0> }
union { 
         object { default_13_stems
                pigment {color rgb <1, .6, .1>} }
         object { default_13_leaves
                texture { pigment { color rgb <1, 0, .7> } 
                          finish { ambient 0.15 diffuse 0.8 }}}
         rotate 90*y 
       }  
       
       
#declare Base_Tex =
 texture {
   pigment {
     granite
     turbulence 3
     color_map {
       [0.000 color rgb <0.5, 0.5, 0.2>]
       [0.25 color rgb <0.7, 1, 0.2>]
       [0.5 color rgb <1, 0.4, 0.2>]
       [0.75 color rgb <.5, 0.9, 0.2>]
       [1 color rgb <0.3, 0.9, 0.2>]
     }
     scale 0.035
   }
   finish{specular .25 }
           normal{
             average normal_map{
                 [0.0 bumps 150 scale 30]
                 [0.2 dents 50 scale 12.5 turbulence .3]
                 [0.6 bump_map{ gif "GBM4.gif" bump_size 50} rotate x*90
 rotate y*45 scale 30 ]
                 [1.0 wrinkles 25 scale 5 scallop_wave rotate z*30]
                 }//end of normal map
                 rotate z*15 turbulence .4
               }//end of normal dec
 }                                                                                                               