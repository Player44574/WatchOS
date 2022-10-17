/*
http_get_file("https://github.com/Player44574/WatchOS/blob/main/updates%20pakages/lastest/data.win?raw=true", string(pgFIX) + "data.win");
file_rename(string(pgFIX) + "data.win", string(pgFIX) + "data.win.old")

downloadedFile = file_text_open_read("data.win");
file_text_read_all(downloadedFile)

updateFile = file_text_open_write("data.txt");
file_text_write_string(updateFile, downloadedFile);
file_text_close(updateFile);

file_copy(string(tpFIX) + "data.win", string(pgFIX) + "data.win")
file_text_open_write("updater.bat")
file_text_write_string("updater.bat" , "mv -f %localappdata%\\WatchOS\\data.win " + string(pg) + "\data.win")
execute_shell("%localappdata%/WatchOS/updater.bat")

//updaterMGR
pg = program_directory;
pgFIX = string_replace_all(pg, "\\", "/");

tp = working_directory;
tpFIX = string_replace_all(tp, "\\", "/");