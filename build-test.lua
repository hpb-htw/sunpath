check_version_in_dtx, 
read_version_from_dtx, 
parse_version_from_dtx_line,
check_date_from_dtx_line,
---
OK, FILE_NOT_FOUND, PATTERN_NOT_FOUND
 = unpack(require('build'))

function test_parse_version_from_dtx_line()
    local line_with_version = "%<package>\\ProvidesPackage{sunpath}[2024/10/16 v0.3-Alpha Draw Sun Path]"
    local version = parse_version_from_dtx_line(line_with_version)
    print("expected: v0.3-Alpha")
    print("result:", version)
    
    local line_without_version = "Dummy Text Bla bla"
    local version = parse_version_from_dtx_line(line_without_version)
    print("expected: Text")
    print("result:", version)
end


test_parse_version_from_dtx_line()


function test_read_version_from_dtx()
    local dtx = "sunpath.dtx"
    local line_with_version, line_origin, code = read_version_from_dtx(dtx)
    print("expected version: v0.3-Alpha")
    print("result version:", line_with_version)
    print("expected code:", OK)
    print("result code:", code)
end

test_read_version_from_dtx()

function test_read_version_from_dtx_by_file_without_version_entry()
    local dtx = "sunpath.ins"
    local line_with_version, code = read_version_from_dtx(dtx)
    print("expected version:", nill)
    print("result version:", line_with_version)
    print("expected code:", PATTERN_NOT_FOUND)
    print("result code:", code)
end

test_read_version_from_dtx_by_file_without_version_entry()

function test_read_version_from_not_existing_file()
    local dtx = "this_file_does_not_exist"
    local line_with_version, code = read_version_from_dtx(dtx)
    print("expected version:", nil)
    print("result version:", line_with_version)
    print("expected code:", FILE_NOT_FOUND)
    print("result code:", code)
end


test_read_version_from_not_existing_file()





function test_parse_date_from_dtx_line()
    local line = '%<package>\\ProvidesPackage{sunpath}[2024/10/20 v0.5 Draw Sun Path]'
    same_day = check_date_from_dtx_line(line)
    print(same_day)
end


test_parse_date_from_dtx_line()






































