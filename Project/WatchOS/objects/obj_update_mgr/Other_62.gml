show_debug_message("id: " + string(ds_map_find_value(async_load, "id")))
show_debug_message("status: " + string(ds_map_find_value(async_load, "status")))
show_debug_message("result: " + string(ds_map_find_value(async_load, "result")))

ini_open("current.ini")
cloudVersion = ini_read_real("version","build","0.00");
ini_close();

if cloudVersion <= installedVersion{show_debug_message("No update found")} else if cloudVersion > installedVersion{show_debug_message("Update found!")}