using TulipaProfileFitting
using Documenter

DocMeta.setdocmeta!(
    TulipaProfileFitting,
    :DocTestSetup,
    :(using TulipaProfileFitting);
    recursive = true,
)

const page_rename =
    Dict("developer.md" => "Developer docs", "formulation.md" => "Mathematical formulation") # Without the numbers

function nice_name(file)
    file = replace(file, r"^[0-9]*-" => "")
    if haskey(page_rename, file)
        return page_rename[file]
    end
    return splitext(file)[1] |> x -> replace(x, "-" => " ") |> titlecase
end

makedocs(;
    modules = [TulipaProfileFitting],
    doctest = true,
    linkcheck = false, # Rely on Lint.yml/lychee for the links
    authors = "TNO <diego.tejadaarango@tno.nl> and contributors",
    repo = "https://github.com/TulipaEnergy/TulipaProfileFitting.jl/blob/{commit}{path}#{line}",
    sitename = "TulipaProfileFitting.jl",
    format = Documenter.HTML(;
        prettyurls = true,
        canonical = "https://TulipaEnergy.github.io/TulipaProfileFitting.jl",
        assets = ["assets/style.css"],
    ),
    pages = [
        "Home" => "index.md"
        [
            nice_name(file) => file for file in readdir(joinpath(@__DIR__, "src")) if
            file != "index.md" && splitext(file)[2] == ".md"
        ]
    ],
)

deploydocs(; repo = "github.com/TulipaEnergy/TulipaProfileFitting.jl", push_preview = true)
