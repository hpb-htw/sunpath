# `sunpath` -- Draw Sun Path #


(C) 2019 Hồng-Phúc Bùi




## Licence ##


This package may be distributed and/or modified under the conditions of the
LaTeX Project Public License (LPPL), either version 1.3c of this
License or any later version.  The latest version
of this license is in the file https://www.latex-project.org/lppl.txt

## Build and Install (for Distributor) ##


* To build the style file `sunpath.sty` just run **one** of

```
latex sunpath.ins
pdflatex sunpath.ins
xelatex sunpath.ins
lualatex sunpath.ins
```

then you can copy `sunpath.sty` to your local `texmf` tree, where latex can find it.

* To create PDF Document manual you must use `lualatex`

```
lualatex sunpath.dtx
lualatex sunpath.usage.tex
lualatex sunpath.lstlisting.tex
```

(`lualatex` because of my name, really ego right! It needs unicode to be typeset correctly.)

## Development ##


I try to use latex3 as much as posible. You can use 

```
l3build doc
```

to create the style file and documentation files at once. You can also (like I also do) use `make`
to call repeatly tasks.

