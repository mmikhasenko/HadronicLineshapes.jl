using HadronicLineshapes
using Documenter

DocMeta.setdocmeta!(
    HadronicLineshapes,
    :DocTestSetup,
    :(using HadronicLineshapes);
    recursive = true,
)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

makedocs(;
    modules = [HadronicLineshapes],
    authors = "Mikhail Mikhasenko <mikhail.mikhasenko@cern.ch> and contributors",
    repo = "https://github.com/mmikhasenko/HadronicLineshapes.jl/blob/{commit}{path}#{line}",
    sitename = "HadronicLineshapes.jl",
    format = Documenter.HTML(;
        canonical = "https://mmikhasenko.github.io/HadronicLineshapes.jl",
        repolink = "https://github.com/mmikhasenko/HadronicLineshapes.jl",
    ),
    pages = [
        "index.md"
        [
            file for file in readdir(joinpath(@__DIR__, "src")) if
            file != "index.md" && splitext(file)[2] == ".md"
        ]
    ],
)

deploydocs(; repo = "github.com/mmikhasenko/HadronicLineshapes.jl")
