using TulipaProfileFitting
using Documenter

DocMeta.setdocmeta!(
    TulipaProfileFitting,
    :DocTestSetup,
    :(using TulipaProfileFitting);
    recursive = true,
)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [TulipaProfileFitting],
    authors = "Diego Tejada <diego.tejadaarango@tno.nl> and contributors",
    repo = "https://github.com/TulipaEnergy/TulipaProfileFitting.jl/blob/{commit}{path}#{line}",
    sitename = "TulipaProfileFitting.jl",
    format = Documenter.HTML(;
        canonical = "https://TulipaEnergy.github.io/TulipaProfileFitting.jl",
    ),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/TulipaEnergy/TulipaProfileFitting.jl")
