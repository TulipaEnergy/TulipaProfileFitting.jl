using TulipaProfileFitting
using Documenter

DocMeta.setdocmeta!(
    TulipaProfileFitting,
    :DocTestSetup,
    :(using TulipaProfileFitting);
    recursive = true,
)

makedocs(;
    modules = [TulipaProfileFitting],
    doctest = true,
    linkcheck = true,
    authors = "TNO <diego.tejadaarango@tno.nl> and contributors",
    repo = "https://github.com/TulipaEnergy/TulipaProfileFitting.jl/blob/{commit}{path}#{line}",
    sitename = "TulipaProfileFitting.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://TulipaEnergy.github.io/TulipaProfileFitting.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
        "Mathematical Formulation" => "formulation.md",
        "Example" => "example.md",
        "Contributing" => "contributing.md",
        "Dev setup" => "developer.md",
        "Reference" => "reference.md",
    ],
)

deploydocs(; repo = "github.com/TulipaEnergy/TulipaProfileFitting.jl", devbranch = "main")
