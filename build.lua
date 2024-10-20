local VERSION_CHECK_PATTERN = "<package>\\ProvidesPackage{"

local OK = 0
local FILE_NOT_FOUND = 99
local PATTERN_NOT_FOUND = 10


-- check if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- parse the version parts of the line  "%<package>\ProvidesPackage{sunpath}[2024/10/16 v0.2-Alpha Draw Sun Path]"
function parse_version_from_dtx_line(line)
    local sep = "([^%s]+)"
    local t = {}
    for str in string.gmatch(line, sep) do
        table.insert(t, str)  -- not the best solution, but work
    end
    return t[2]
end

function read_version_from_dtx(file)
    if not file_exists(file) then return nil, FILE_NOT_FOUND end
    local version_line = nil
    for line in io.lines(file) do
        local start_idx, end_idx = string.find(line, VERSION_CHECK_PATTERN)
        if start_idx ~= nil then
            version_line =  line
            break
        end
    end
    if version_line ~= nill then
        return parse_version_from_dtx_line(version_line), version_line, OK
    else
        return nil, nil, PATTERN_NOT_FOUND
    end
end

--[[ Usage:
x, y = read_version_from_dtx("sunpath.dtx")
print(x, y)
]]--


-- release time and declared time in the dtx must in a same day.
function check_date_from_dtx_line(line)
    local pattern = "(%d+)/(%d+)/(%d+)"
    local _,_,y,m,d = string.find(line, pattern)
    local year = tonumber(y)
    local month = tonumber(m)
    local day = tonumber(d)
    
        
    local t = os.time()
    local d = os.date("*t", t)    
    local sys_time = os.time({year=d.year, month=d.month, day=d.day, hour=0, min=0, sec=0, isdst=d.isdst})
    local rel_time = os.time({year=year,   month=month,   day=day,   hour=0, min=0, sec=0, isdst=d.isdst})
    return sys_time == rel_time
end


function check_version_in_dtx(file)
    local version, release_info, read_ok = read_version_from_dtx(file)
    if version ~= nil then
        if check_date_from_dtx_line(release_info) then
            return version
        else 
            print(string.format("Declared release time `%s' is in the pass", release_info))
        end
    else 
        if read_ok == FILE_NOT_FOUND then
            print(string.format("File `%s' not found", file))
        elseif read_ok == PATTERN_NOT_FOUND then
            print(string.format("No version is found in file `%s'", file))
            print("Please check if the pattern below exists in the given file")
            print(VERSION_CHECK_PATTERN)
        end        
    end
    os.exit(1)
end



-- build script for sunpath.dtx
module = "sunpath"
bundle = ""

sourcefiles = {
    "sunpath.dtx",
    "sunpath.ins",
    "sunpath.tex",    
    "support/*.tex",
    "support/*.pdf"
}

-- Typeset configuration
typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode --recorder"
typesetsuppfiles = { 
    "sunpath.docpart.tex",
    "horizontal-coordinate.pdf",
    "horizontal-coordinate.tex"
}
typesetfiles  = {
    -- keep this option empty. Documents are written in sunpath.tex.
    -- See below
    "sunpath.tex",    -- main document file
}
typesetdemofiles = {
    "sunpath.spherical.tex",
    "sunpath.equidistance.tex",
    "sunpath.track.tex",
    --- these files are for testing this package in difference classes!
    --"sunpath.l3doc.tex",    -- this will not work   
    "sunpath.article.tex",    -- test with article class
    "sunpath.scrartcl.tex"   -- test with scrartcl class
}

-- Copy all files match pattern to build/doc
-- therefore use \input{java-program} instead of \input{demo-code/java-program.tex}
docfiles = {
    "sunpath.docpart.tex"
}


uploadconfig = {
    pkg          = "sunpath",
    description  = "Draw Sun path Chart",
    topic        = "tikz",
    version      = check_version_in_dtx("sunpath.dtx"),
    author       = "Hồng-Phúc Bùi",
    uploader     = "Hồng-Phúc Bùi",
    email        = "hong-phuc.bui@htwsaar.de",
    license      = "lppl1.3c",
    summary      = "provide tool to draw sunpath diagram",
    ctanPath     = "/graphics/pgf/contrib/sunpath",
    home         = "https://github.com/hpb-htw/sunpath.git",
    repository   = "https://github.com/hpb-htw/sunpath.git",
    bugtracker   = "https://github.com/hpb-htw/sunpath/issues",
    development  = "https://github.com/hpb-htw/sunpath/issues",
    support      = "https://github.com/hpb-htw/sunpath/issues",
    note         = [[Uploaded automatically by l3build]],
}
  



-- returns functions to test them in Unittest
return {
    check_version_in_dtx,
    read_version_from_dtx,
    parse_version_from_dtx_line,
    check_date_from_dtx_line,
    -- Error code
    OK, FILE_NOT_FOUND, PATTERN_NOT_FOUND
}






