using HadronicLineshapes
using Documenter
using Literate

DocMeta.setdocmeta!(
    HadronicLineshapes,
    :DocTestSetup,
    :(using HadronicLineshapes);
    recursive = true,
)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

function fix_literate_output(content)
    content = replace(content, "EditURL = \"@__REPO_ROOT_URL__/\"" => "")
    return content
end

docs_src_dir = joinpath(@__DIR__, "src")
#
files = readdir(docs_src_dir)
filter!(file -> splitext(file)[2] == ".jl", files)
map(files) do file
    name = splitext(file)[1]
    tutorial_src = joinpath(@__DIR__, "src", "$(name).jl")
    Literate.markdown(
        tutorial_src,
        docs_src_dir;
        name,
        documenter = true,
        credit = true,
        postprocess = fix_literate_output,
    )
end

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
            file for file in readdir(docs_src_dir) if
            file != "index.md" && splitext(file)[2] == ".md"
        ]
    ],
)

deploydocs(;
    repo = "github.com/mmikhasenko/HadronicLineshapes.jl",
    devbranch = "main",
    versions = ["stable" => "v^", "v#.#", "dev" => "main"],
)
