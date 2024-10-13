-- build script for sunpath.dtx
module = "sunpath"
bundle = ""

-- Typeset configuration
typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode --recorder"
typesetfiles  = {"sunpath.dtx"}
typesetdemofiles = {
    "sunpath.usage.tex"
}

-- Copy all files match pattern to build/doc
-- therefore use \input{java-program} instead of \input{demo-code/java-program.tex}
--[[
docfiles = {
    "demo-code/*"
}
]]--

uploadconfig = {
    pkg          = "sunpath",
    version      = "0.1-Alpha",
    author       = "Hồng-Phúc Bùi",
    uploader     = "Hồng-Phúc Bùi",
    email        = "hong-phuc.bui@htwsaar.de",
    license      = "lppl1.3c",
    summary      = "provide tool to dram sunpath diagram",
    ctanPath     = "/graphics/pgf/contrib/sunpath",
    home         = "https://github.com/hpb-htw/sunpath.git",
    repository   = "https://github.com/hpb-htw/sunpath.git",
    bugtracker   = "https://github.com/hpb-htw/sunpath/issues",
    note         = [[Uploaded automatically by l3build]]
  }
