RSRC                    VisualShader            ��������                                            v      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    linked_parent_graph_frame    parameter_name 
   qualifier    default_value_enabled    default_value    script    input_name    op_type 	   operator    hint    min    max    step 	   function    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/9/node    nodes/fragment/9/position    nodes/fragment/10/node    nodes/fragment/10/position    nodes/fragment/11/node    nodes/fragment/11/position    nodes/fragment/12/node    nodes/fragment/12/position    nodes/fragment/13/node    nodes/fragment/13/position    nodes/fragment/14/node    nodes/fragment/14/position    nodes/fragment/15/node    nodes/fragment/15/position    nodes/fragment/17/node    nodes/fragment/17/position    nodes/fragment/18/node    nodes/fragment/18/position    nodes/fragment/19/node    nodes/fragment/19/position    nodes/fragment/20/node    nodes/fragment/20/position    nodes/fragment/22/node    nodes/fragment/22/position    nodes/fragment/23/node    nodes/fragment/23/position    nodes/fragment/24/node    nodes/fragment/24/position    nodes/fragment/25/node    nodes/fragment/25/position    nodes/fragment/26/node    nodes/fragment/26/position    nodes/fragment/27/node    nodes/fragment/27/position    nodes/fragment/28/node    nodes/fragment/28/position    nodes/fragment/29/node    nodes/fragment/29/position    nodes/fragment/30/node    nodes/fragment/30/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        
   local://3 .      
   local://4 p      
   local://5 �      
   local://6 .      
   local://7 �      
   local://8 �      
   local://9          local://10 W      
   local://1 �      
   local://2 	         local://11 J         local://12 �         local://13 �         local://14 6         local://15 �         local://16 �         local://17 4         local://18 �         local://19 �         local://20 �         local://21 \         local://22 �         local://23          local://24 O         local://25 �         local://26 �         local://27       L   res://addons/godot-xr-tools/misc/hold_button_gaze_pointer_visualshader.tres s         VisualShaderNodeColorParameter             albedo 
         VisualShaderNodeInput                       uv 
         VisualShaderNodeVectorOp                                                         @   @             
         VisualShaderNodeVectorOp                                                        ��  ��    
         VisualShaderNodeVectorLen              
         VisualShaderNodeFloatOp                       
         VisualShaderNodeFloatParameter             radius 
         VisualShaderNodeFloatFunc                       
         VisualShaderNodeFloatOp                                           )   �������?         
         VisualShaderNodeFloatParameter             width 
         VisualShaderNodeFloatOp                                   �?                      
         VisualShaderNodeFloatOp                       
         VisualShaderNodeFloatParameter             fade 
         VisualShaderNodeFloatOp                                       @         
         VisualShaderNodeVectorFunc              
         VisualShaderNodeDotProduct                                                  ��    
         VisualShaderNodeVectorOp                                                  ��             
          VisualShaderNodeVectorDecompose    
         VisualShaderNodeIf    
         VisualShaderNodeFloatOp                    )   �72��!@                      
         VisualShaderNodeFloatFunc                       
         VisualShaderNodeFloatOp                                           )   �72��!@         
         VisualShaderNodeFloatParameter             value 
         VisualShaderNodeFloatOp                       
         VisualShaderNodeFloatOp                       
         VisualShaderNodeFloatOp                       
         VisualShaderNodeFloatOp                                 )   �72��!@         
         VisualShader <         �	  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx, depth_test_disabled, unshaded;

uniform vec4 albedo : source_color;
uniform float value;
uniform float fade;
uniform float radius;
uniform float width;



void fragment() {
// ColorParameter:2
	vec4 n_out2p0 = albedo;


// Input:3
	vec2 n_out3p0 = UV;


// VectorOp:4
	vec3 n_in4p1 = vec3(2.00000, 2.00000, 0.00000);
	vec3 n_out4p0 = vec3(n_out3p0, 0.0) * n_in4p1;


// VectorOp:5
	vec3 n_in5p1 = vec3(-1.00000, -1.00000, 0.00000);
	vec3 n_out5p0 = n_out4p0 + n_in5p1;


// VectorFunc:17
	vec3 n_out17p0 = normalize(n_out5p0);


// VectorOp:19
	vec3 n_in19p1 = vec3(0.00000, -1.00000, 0.00000);
	vec3 n_out19p0 = cross(n_out17p0, n_in19p1);


// VectorDecompose:20
	float n_out20p0 = n_out19p0.x;
	float n_out20p1 = n_out19p0.y;
	float n_out20p2 = n_out19p0.z;


// DotProduct:18
	vec3 n_in18p1 = vec3(0.00000, -1.00000, 0.00000);
	float n_out18p0 = dot(n_out17p0, n_in18p1);


// FloatFunc:24
	float n_out24p0 = acos(n_out18p0);


// FloatOp:23
	float n_in23p0 = 6.28319;
	float n_out23p0 = n_in23p0 - n_out24p0;


	vec3 n_out22p0;
// If:22
	float n_in22p1 = 0.00000;
	float n_in22p2 = 0.00001;
	if(abs(n_out20p2 - n_in22p1) < n_in22p2)
	{
		n_out22p0 = vec3(n_out24p0);
	}
	else if(n_out20p2 < n_in22p1)
	{
		n_out22p0 = vec3(n_out24p0);
	}
	else
	{
		n_out22p0 = vec3(n_out23p0);
	}


// FloatOp:25
	float n_in25p1 = 6.28319;
	float n_out25p0 = n_out22p0.x / n_in25p1;


// FloatParameter:26
	float n_out26p0 = value;


// FloatOp:27
	float n_out27p0 = n_out25p0 - n_out26p0;


// FloatParameter:14
	float n_out14p0 = fade;


// FloatOp:30
	float n_in30p1 = 6.28319;
	float n_out30p0 = n_out14p0 / n_in30p1;


// FloatOp:28
	float n_out28p0 = n_out27p0 / n_out30p0;


// VectorLen:6
	float n_out6p0 = length(n_out5p0);


// FloatParameter:8
	float n_out8p0 = radius;


// FloatOp:7
	float n_out7p0 = n_out6p0 - n_out8p0;


// FloatFunc:9
	float n_out9p0 = abs(n_out7p0);


// FloatParameter:11
	float n_out11p0 = width;


// FloatOp:15
	float n_in15p1 = 2.00000;
	float n_out15p0 = n_out11p0 / n_in15p1;


// FloatOp:13
	float n_out13p0 = n_out9p0 - n_out15p0;


// FloatOp:10
	float n_out10p0 = n_out13p0 / n_out14p0;


// FloatOp:29
	float n_out29p0 = max(n_out28p0, n_out10p0);


// FloatOp:12
	float n_in12p0 = 1.00000;
	float n_out12p0 = n_in12p0 - n_out29p0;


// Output:0
	ALBEDO = vec3(n_out2p0.xyz);
	ALPHA = n_out12p0;


}
                   .   
     �D   �/             0   
     �D  H�1            2   
     \�  HC3            4   
     ��  HC5            6   
     4C  HC7            8   
     �C  HC9            :   
     D  HC;            <   
     �C  �C=            >   
     CD  HC?            @   
     �D  HCA         	   B   
     �C  DC         
   D   
     �D  pBE            F   
     zD  HCG            H   
     �C  CDI            J   
     D  DK            L   
     ��  ��M            N   
     ��   �O            P   
     ��  4�Q            R   
     pB  4�S            T   
     D  ��U            V   
     �C   BW            X   
     pB   �Y            Z   
     HD  ��[            \   
     %D  ��]            ^   
     zD  ��_            `   
     �D  ��a            b   
     �D  pBc            d   
     zD  p�e       �                                                                                              	                     	                     
              
                                                                                                                                                                                                                                             
                                                     
      RSRC