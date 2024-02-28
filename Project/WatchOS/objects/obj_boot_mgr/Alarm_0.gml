if keyboard_check(vk_enter){
	instance_create_layer(0,0,layer,obj_recovery)
	instance_destroy();
}else if setupPhase=0{
	instance_create_layer(0,0,layer,obj_setup_app)
	instance_destroy();
}else{
	instance_create_layer(0,0,layer,obj_lockScreen)
	instance_destroy();
}