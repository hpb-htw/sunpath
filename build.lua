-- build script for sunpath.dtx
module = "sunpath"
bundle = ""

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
}
typesetdemofiles = {
    "sunpath.tex",    -- main document file
    "sunpath.demo.tex",
    -- these files are for testing this package in difference classes!
    --"sunpath.l3doc.tex",    -- this will not work   
    "sunpath.article.tex",    -- test with article class
    "sunpath.scrartcl.tex"   -- test with scrartcl class
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
    description  = "Draw Sun path Chart",
    topic        = "tikz",
    version      = "0.1-Alpha",
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
    update       = "false"
  }
  
  
-- Remove the update after the first upload done  
