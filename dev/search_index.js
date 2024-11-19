var documenterSearchIndex = {"docs":
[{"location":"91-developer/#dev_docs","page":"Developer documentation","title":"Developer documentation","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"note: Contributing guidelines\nIf you haven't, please read the Contributing guidelines first.","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"If you want to make contributions to this package that involves code, then this guide is for you.","category":"page"},{"location":"91-developer/#First-time-clone","page":"Developer documentation","title":"First time clone","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"tip: If you have writing rights\nIf you have writing rights, you don't have to fork. Instead, simply clone and skip ahead. Whenever upstream is mentioned, use origin instead.","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"If this is the first time you work with this repository, follow the instructions below to clone the repository.","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Fork this repo\nClone your repo (this will create a git remote called origin)\nAdd this repo as a remote:\ngit remote add upstream https://github.com/mmikhasenko/HadronicLineshapes.jl","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"This will ensure that you have two remotes in your git: origin and upstream. You will create branches and push to origin, and you will fetch and update your local main branch from upstream.","category":"page"},{"location":"91-developer/#Linting-and-formatting","page":"Developer documentation","title":"Linting and formatting","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Install a plugin on your editor to use EditorConfig. This will ensure that your editor is configured with important formatting settings.","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"We use https://pre-commit.com to run the linters and formatters. In particular, the Julia code is formatted using JuliaFormatter.jl, so please install it globally first:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"julia> # Press ]\npkg> activate\npkg> add JuliaFormatter","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"To install pre-commit, we recommend using pipx as follows:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"# Install pipx following the link\npipx install pre-commit","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"With pre-commit installed, activate it as a pre-commit hook:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"pre-commit install","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"To run the linting and formatting manually, enter the command below:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"pre-commit run -a","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Now, you can only commit if all the pre-commit tests pass.","category":"page"},{"location":"91-developer/#Testing","page":"Developer documentation","title":"Testing","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"As with most Julia packages, you can just open Julia in the repository folder, activate the environment, and run test:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"julia> # press ]\npkg> activate .\npkg> test","category":"page"},{"location":"91-developer/#Working-on-a-new-issue","page":"Developer documentation","title":"Working on a new issue","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"We try to keep a linear history in this repo, so it is important to keep your branches up-to-date.","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Fetch from the remote and fast-forward your local main\ngit fetch upstream\ngit switch main\ngit merge --ff-only upstream/main\nBranch from main to address the issue (see below for naming)\ngit switch -c 42-add-answer-universe\nPush the new local branch to your personal remote repository\ngit push -u origin 42-add-answer-universe\nCreate a pull request to merge your remote branch into the org main.","category":"page"},{"location":"91-developer/#Branch-naming","page":"Developer documentation","title":"Branch naming","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"If there is an associated issue, add the issue number.\nIf there is no associated issue, and the changes are small, add a prefix such as \"typo\", \"hotfix\", \"small-refactor\", according to the type of update.\nIf the changes are not small and there is no associated issue, then create the issue first, so we can properly discuss the changes.\nUse dash separated imperative wording related to the issue (e.g., 14-add-tests, 15-fix-model, 16-remove-obsolete-files).","category":"page"},{"location":"91-developer/#Commit-message","page":"Developer documentation","title":"Commit message","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Use imperative or present tense, for instance: Add feature or Fix bug.\nHave informative titles.\nWhen necessary, add a body with details.\nIf there are breaking changes, add the information to the commit message.","category":"page"},{"location":"91-developer/#Before-creating-a-pull-request","page":"Developer documentation","title":"Before creating a pull request","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"tip: Atomic git commits\nTry to create \"atomic git commits\" (recommended reading: The Utopic Git History).","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Make sure the tests pass.\nMake sure the pre-commit tests pass.\nFetch any main updates from upstream and rebase your branch, if necessary:\ngit fetch upstream\ngit rebase upstream/main BRANCH_NAME\nThen you can open a pull request and work with the reviewer to address any issues.","category":"page"},{"location":"91-developer/#Building-and-viewing-the-documentation-locally","page":"Developer documentation","title":"Building and viewing the documentation locally","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Following the latest suggestions, we recommend using LiveServer to build the documentation. Here is how you do it:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Run julia --project=docs to open Julia in the environment of the docs.\nIf this is the first time building the docs\nPress ] to enter pkg mode\nRun pkg> dev . to use the development version of your package\nPress backspace to leave pkg mode\nRun julia> using LiveServer\nRun julia> servedocs()","category":"page"},{"location":"91-developer/#Making-a-new-release","page":"Developer documentation","title":"Making a new release","text":"","category":"section"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"To create a new release, you can follow these simple steps:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Create a branch release-x.y.z\nUpdate version in Project.toml\nUpdate the CHANGELOG.md:\nRename the section \"Unreleased\" to \"[x.y.z] - yyyy-mm-dd\" (i.e., version under brackets, dash, and date in ISO format)\nAdd a new section on top of it named \"Unreleased\"\nAdd a new link in the bottom for version \"x.y.z\"\nChange the \"[unreleased]\" link to use the latest version - end of line, vx.y.z ... HEAD.\nCreate a commit \"Release vx.y.z\", push, create a PR, wait for it to pass, merge the PR.\nGo back to main screen and click on the latest commit (link: https://github.com/mmikhasenko/HadronicLineshapes.jl/commit/main)\nAt the bottom, write @JuliaRegistrator register","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"After that, you only need to wait and verify:","category":"page"},{"location":"91-developer/","page":"Developer documentation","title":"Developer documentation","text":"Wait for the bot to comment (should take < 1m) with a link to a RP to the registry\nFollow the link and wait for a comment on the auto-merge\nThe comment should said all is well and auto-merge should occur shortly\nAfter the merge happens, TagBot will trigger and create a new GitHub tag. Check on https://github.com/mmikhasenko/HadronicLineshapes.jl/releases\nAfter the release is create, a \"docs\" GitHub action will start for the tag.\nAfter it passes, a deploy action will run.\nAfter that runs, the stable docs should be updated. Check them and look for the version number.","category":"page"},{"location":"10-breitwigner/#lineshape_parametrizations","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"","category":"section"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"This page provides a description of the lineshape parametrizations used in the HadronicLineshapes package. The implementation is consistent with the Review on Resonances by Particle Data Group up to an overall normalization factor.","category":"page"},{"location":"10-breitwigner/#Breit-Wigner-Function","page":"Lineshape Parametrizations","title":"Breit-Wigner Function","text":"","category":"section"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"The BreitWigner function is a simplest lineshape used to describe resonances in particle physics. It is defined as:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"BW(sigma m Gamma) = frac1m^2 - sigma - i m Gamma","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"where:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"Variable m is the resonance mass,\nVariable Gamma is the total decay width,\nVariable sigma is the Mandelstam variable denoting squared mass of the system.","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"This parametrization assumes a single channel decay with no form factors or orbital angular momentum contributions. For an elastic resonance with l-wave a energy-dependent expression is used for the width,","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"Gamma(sigma) = Gamma_0 left( fracq(sigma)q_0 right)^2l+1 fracmsqrtsigma fracF_l^2(q(sigma) d)F_l^2(q_0 d)","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"where q = q(sqrtsigma m_1 m_2) is the momentum of the decay products in the center-of-mass frame, and q_0 is the momentum evaluated for the nominal mass of the resonance. By default, the Blatt-Weisskopf form factor are used for F_l(q d).","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"tip: Using the BreitWigner Function\nTo create a BreitWigner instance in the HadronicLineshapes package, you can use the following constructor:BreitWigner(m::Float64, Γ::Float64)\nBreitWigner(m::Float64, Γ::Float64, ma::Float64, mb::Float64, l::Int, d::Float64)For the first call, the default values for ma, mb, l, and d are set to 0.0, 0.0, 0, and 1.0, respectively, yielding the constant-width Breit-Wigner function.","category":"page"},{"location":"10-breitwigner/#Multichannel-Breit-Wigner-Function","page":"Lineshape Parametrizations","title":"Multichannel Breit-Wigner Function","text":"","category":"section"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"The MultichannelBreitWigner function extends the BreitWigner to multiple decay channels. Each channel can have its own mass thresholds, coupling constants, and orbital angular momentum contributions. The function is defined as:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"textMultichannelBW(sigma m Gamma_i) = frac1m^2 - sigma - i sum_k g_k^2 cdot rho_k(sigma)","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"where:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"Variable g_k^2 are the coupling constants for each channel,\nFunctions rho_k(sigma) = 2q_ksqrtsigma are the phase space factors for the respective channels.","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"The total decay width Gamma(sigma) is the sum of partial widths across all channels.","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"advice: Constructing a Multichannel Breit-Wigner\nTo create a MultichannelBreitWigner, you can specify the parameters for each channel as a NamedTuple within a vector. Here's an example:MultichannelBreitWigner(\n    m::Real,\n    channels::Vector{<:NamedTuple{(:gsq, :ma, :mb, :l, :d)}})Use the BlattWeisskopf form factor function as needed, and remember to ensure all channel parameters are consistent with the physics of your problem.","category":"page"},{"location":"10-breitwigner/#Flatté-Function","page":"Lineshape Parametrizations","title":"Flatté Function","text":"","category":"section"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"The Flatté function is a special case of the MultichannelBreitWigner designed to describe resonances with two S-wave channels. The function is expressed as:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"textFlatté(sigma) = frac1m^2 - sigma - i left( g_1^2 cdot rho_1(sigma) + g_2^2 cdot rho_2(sigma) right)","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"where:","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"Variables g_1 and g_2 are the coupling constants for the two channels,\nFunctions rho_1(sigma) and rho_2(sigma) are the corresponding phase space factors.","category":"page"},{"location":"10-breitwigner/","page":"Lineshape Parametrizations","title":"Lineshape Parametrizations","text":"tip: Using Flatté function\nWhen implementing the Flatté function, use the MultichannelBreitWigner as a base and define the parameters for each of the two channels. Example instantiation:Flatte(m, gsq1, ma1, mb1, gsq2, ma2, mb2) # with Float64 parametersThis function is widely used for resonances like the f_0(980) with pipi and KbarK channels.","category":"page"},{"location":"95-reference/#reference","page":"Reference","title":"Reference","text":"","category":"section"},{"location":"95-reference/#Contents","page":"Reference","title":"Contents","text":"","category":"section"},{"location":"95-reference/","page":"Reference","title":"Reference","text":"Pages = [\"10-breitwigner.md\", \"95-reference.md\"]","category":"page"},{"location":"95-reference/#Index","page":"Reference","title":"Index","text":"","category":"section"},{"location":"95-reference/","page":"Reference","title":"Reference","text":"Pages = [\"10-breitwigner.md\", \"95-reference.md\"]","category":"page"},{"location":"95-reference/","page":"Reference","title":"Reference","text":"Modules = [HadronicLineshapes]","category":"page"},{"location":"90-contributing/#contributing","page":"Contributing guidelines","title":"Contributing guidelines","text":"","category":"section"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"First of all, thanks for the interest!","category":"page"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"We welcome all kinds of contribution, including, but not limited to code, documentation, examples, configuration, issue creating, etc.","category":"page"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"Be polite and respectful, and follow the code of conduct.","category":"page"},{"location":"90-contributing/#Bug-reports-and-discussions","page":"Contributing guidelines","title":"Bug reports and discussions","text":"","category":"section"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"If you think you found a bug, feel free to open an issue. Focused suggestions and requests can also be opened as issues. Before opening a pull request, start an issue or a discussion on the topic, please.","category":"page"},{"location":"90-contributing/#Working-on-an-issue","page":"Contributing guidelines","title":"Working on an issue","text":"","category":"section"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"If you found an issue that interests you, comment on that issue what your plans are. If the solution to the issue is clear, you can immediately create a pull request (see below). Otherwise, say what your proposed solution is and wait for a discussion around it.","category":"page"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"tip: Tip\nFeel free to ping us after a few days if there are no responses.","category":"page"},{"location":"90-contributing/","page":"Contributing guidelines","title":"Contributing guidelines","text":"If your solution involves code (or something that requires running the package locally), check the developer documentation. Otherwise, you can use the GitHub interface directly to create your pull request.","category":"page"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"CurrentModule = HadronicLineshapes","category":"page"},{"location":"#HadronicLineshapes","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"","category":"section"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"The HadronicLineshapes a Julia package provides models for description of hadronic scattering processes within particle physics.","category":"page"},{"location":"#Installation","page":"HadronicLineshapes","title":"Installation","text":"","category":"section"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"To install HadronicLineshapes, use the Julia package manager. From the Julia REPL, enter package mode by pressing ], then run:","category":"page"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"pkg> add https://github.com/mmikhasenko/HadronicLineshapes.jl","category":"page"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"Ensure that you have Julia installed on your system and that the Parameters package, a dependency of HadronicLineshapes, is also installed using the same method.","category":"page"},{"location":"#Usage-and-API-Reference","page":"HadronicLineshapes","title":"Usage and API Reference","text":"","category":"section"},{"location":"#Basic-Usage","page":"HadronicLineshapes","title":"Basic Usage","text":"","category":"section"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"using HadronicLineshapes\n\n# Create a Breit-Wigner\nbw = BreitWigner(1.6, 0.2) # constant-width lineshape function\nbw = BreitWigner(1.6, 0.2, 0.1, 0.2, 1, 1.5) # P-wave\nbw = BreitWigner(; m = 1.6, Γ = 0.2, ma = 0.1, mb = 0.2, l = 1, d = 1.5) # same as above\n#\nmbw = MultichannelBreitWigner(\n    1.6,\n    [\n        (gsq = 0.35, ma = 0.1, mb = 0.2, l = 0, d = 1.0),\n        (gsq = 0.35, ma = 0.3, mb = 0.25, l = 0, d = 1.5),\n    ],\n)\nmbw = Flatte(1.6, 0.35, 0.1, 0.2, 0.35, 0.3, 0.25) # same as above","category":"page"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"See detailed definition in lineshape documentation","category":"page"},{"location":"#API-Overview","page":"HadronicLineshapes","title":"API Overview","text":"","category":"section"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"All of the lineshapes are inherited from AbstractFlexFunc enabling mathematical operations on the functions like multiplication and composition.","category":"page"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"AbstractFlexFunc: Base type for flexible function operations.\nWrapFlexFunction: a simple wrapper for a lambda function.\nComposeFlexFunc: a composition of two functions f(g(x)).\nScaleFlexFunc: a scaled version of a function f(x) * a.\nProductFlexFunc: a product of two functions f(x) * g(x).","category":"page"},{"location":"#Contributors","page":"HadronicLineshapes","title":"Contributors","text":"","category":"section"},{"location":"","page":"HadronicLineshapes","title":"HadronicLineshapes","text":"<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->\n<!-- prettier-ignore-start -->\n<!-- markdownlint-disable -->\n\n<!-- markdownlint-restore -->\n<!-- prettier-ignore-end -->\n\n<!-- ALL-CONTRIBUTORS-LIST:END -->","category":"page"}]
}
