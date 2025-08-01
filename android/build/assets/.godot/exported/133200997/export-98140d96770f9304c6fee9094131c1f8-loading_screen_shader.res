RSRC                    VisualShader            ��������                                            g      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    linked_parent_graph_frame    input_name    script    op_type 	   operator 	   function    type 
   condition    parameter_name 
   qualifier    hint    min    max    step    default_value_enabled    default_value    texture_type    color_default    texture_filter    texture_repeat    texture_source    source    texture    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/11/node    nodes/fragment/11/position    nodes/fragment/12/node    nodes/fragment/12/position    nodes/fragment/13/node    nodes/fragment/13/position    nodes/fragment/14/node    nodes/fragment/14/position    nodes/fragment/15/node    nodes/fragment/15/position    nodes/fragment/16/node    nodes/fragment/16/position    nodes/fragment/17/node    nodes/fragment/17/position    nodes/fragment/18/node    nodes/fragment/18/position    nodes/fragment/19/node    nodes/fragment/19/position    nodes/fragment/20/node    nodes/fragment/20/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections           local://10 4         local://11 i         local://12 �         local://13 K         local://15 �      
   local://5 "      
   local://6 �      
   local://7       
   local://8 4      
   local://9 t         local://17 �         local://18          local://19 E      &   local://VisualShaderNodeTexture_hpnli y      ,   local://VisualShaderNodeVec3Parameter_fhc2j �      N   res://addons/godot-xr-tools/staging/loading_screen/loading_screen_shader.tres :         VisualShaderNodeInput             uv          VisualShaderNodeVectorOp                                               A  �?    	                  VisualShaderNodeVectorOp                                              �@   ?    	                  VisualShaderNodeVectorFunc    
                  VisualShaderNodeCompare                              
                 
   33�@���>      )   �h㈵��>         
                           VisualShaderNodeCompare                              
                 
                 )   �h㈵��>         
                           VisualShaderNodeFloatParameter          	   progress          VisualShaderNodeVectorCompose             VisualShaderNodeFloatOp              	                  VisualShaderNodeColorParameter          
   bar_color       #   VisualShaderNodeTexture2DParameter             bar_texture                   VisualShaderNodeVectorOp    	                  VisualShaderNodeFloatOp    	                  VisualShaderNodeTexture                                                         VisualShaderNodeVec3Parameter             cutout                33�@���>             VisualShader $         �  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx, unshaded;

uniform vec4 bar_color : source_color;
uniform sampler2D bar_texture : source_color;
uniform vec3 cutout = vec3(4.850000, 0.330000, 0.000000);
uniform float progress;



void fragment() {
// ColorParameter:15
	vec4 n_out15p0 = bar_color;


	vec4 n_out19p0;
// Texture2D:19
	n_out19p0 = texture(bar_texture, UV);
	float n_out19p4 = n_out19p0.a;


// VectorOp:17
	vec3 n_out17p0 = vec3(n_out15p0.xyz) * vec3(n_out19p0.xyz);


// Input:3
	vec2 n_out3p0 = UV;


// VectorOp:4
	vec3 n_in4p1 = vec3(10.00000, 1.00000, 0.00000);
	vec3 n_out4p0 = vec3(n_out3p0, 0.0) * n_in4p1;


// VectorOp:5
	vec3 n_in5p1 = vec3(5.00000, 0.50000, 0.00000);
	vec3 n_out5p0 = n_out4p0 - n_in5p1;


// VectorFunc:6
	vec3 n_out6p0 = abs(n_out5p0);


// Vector3Parameter:20
	vec3 n_out20p0 = cutout;


	bool n_out8p0;
// Compare:8
	{
		bvec2 _bv = greaterThan(vec2(n_out6p0.xy), vec2(n_out20p0.xy));
		n_out8p0 = any(_bv);
	}


// FloatParameter:12
	float n_out12p0 = progress;


// VectorCompose:13
	float n_in13p1 = 0.00000;
	float n_in13p2 = 0.00000;
	vec3 n_out13p0 = vec3(n_out12p0, n_in13p1, n_in13p2);


	bool n_out11p0;
// Compare:11
	{
		bvec2 _bv = lessThan(n_out3p0, vec2(n_out13p0.xy));
		n_out11p0 = any(_bv);
	}


// FloatOp:14
	float n_out14p0 = max((n_out8p0 ? 1.0 : 0.0), (n_out11p0 ? 1.0 : 0.0));


// FloatOp:18
	float n_out18p0 = n_out19p4 * n_out14p0;


// Output:0
	ALBEDO = n_out17p0;
	ALPHA = n_out18p0;


}
    
   7:���C'         7   
    ��D  �C8             9   
     �  D:            ;   
     �  �C<            =   
     ��  �C>            ?   
     p�  �C@            A   
     pC  �CB            C   
     pC  WDD            E   
      �  uDF            G   
     ��  pDH            I   
     �C  *DJ         	   K   
     D   �L         
   M   
      B  ��N            O   
     uD  �BP            Q   
     kD  �CR            S   
     �C  �CT            U   
     ��  DV       D                                                                                                                                                                                                                                                 RSRC