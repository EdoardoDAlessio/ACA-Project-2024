#
# Edit package.
# 
set DIR [file dirname [file normalize [info script]]]
puts "Dir: $DIR"

create_project -in_memory
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set_property ip_repo_paths .. [current_project]
update_ip_catalog

add_files $DIR/rtl
set_property top sds_mem_sink [current_fileset]

add_files -fileset [current_fileset -constrset] $DIR/constr
set_property USED_IN {implementation} [get_files [glob $DIR/constr/*]]
foreach FILE [glob $DIR/constr/*] {
	set BASENAME [file rootname [file tail $FILE]]
	set_property SCOPED_TO_REF $BASENAME [get_files $FILE]
}

add_files $DIR/component.xml
set_property file_type "IP-XACT" [get_files $DIR/component.xml]

set_property source_mgmt_mode All [current_project]

