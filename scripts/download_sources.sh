#!/bin/sh
set -eu
# Pinned downloads; verify against config/downloads.json before ingestion.
cd "$(dirname "$0")/.."
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/ip7z/7zip/releases/download/26.03/7z2603-mac.tar.xz -o sources/snapshots/7z2603-mac.tar.xz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://www.7-zip.org/download.html -o sources/snapshots/7zip-download.html
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/compute.rhino3d/archive/aeec0a3fa7d5540b08a30f75f987cc1ae5338874.tar.gz -o sources/snapshots/compute-8.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/compute.rhino3d/branches?per_page=100' -o sources/snapshots/compute-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://registry.npmjs.org/compute-rhino3d/-/compute-rhino3d-0.12.1.tgz -o sources/snapshots/compute-js-0.12.1.tgz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://registry.npmjs.org/compute-rhino3d -o sources/snapshots/compute-npm.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://pypi.org/pypi/compute-rhino3d/json -o sources/snapshots/compute-pypi.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://files.pythonhosted.org/packages/00/df/82db5c1385d46c0e066f299364462b4ef6195e225e5f9aec54487e454392/compute_rhino3d-0.12.2.tar.gz -o sources/snapshots/compute-python-0.12.2.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/cpp/ -o sources/snapshots/cpp-index.html
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://www.rhino3d.com/www-api/download/details?slug=rhino-sdk/8/latest&platform=windows' -o sources/snapshots/cpp8-details.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://www.rhino3d.com/download/rhino-sdk/8/latest/ -o sources/snapshots/cpp8-download.html
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://huggingface.co/gcoli/Qwen3.8-27B-oQ6e-mtp/raw/main/README.md -o sources/snapshots/deployment-README.md
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://www.rhino3d.com/vue-site/assets/index.e4308a7e.js -o sources/snapshots/download-site.js
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/eto.forms/2.11.0/eto.forms.2.11.0.nupkg -o sources/snapshots/eto.forms.2.11.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/developer.rhino3d.com/branches -o sources/snapshots/guides-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/developer.rhino3d.com/commits?until=2026-09-08T23:59:59Z&per_page=1' -o sources/snapshots/guides-targetdate-commit.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/developer.rhino3d.com/archive/659b479af0b6a6a8144f250797ea0a6450fc2e60.tar.gz -o sources/snapshots/guides-targetdate.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/developer.rhino3d.com/archive/548b769596103d0408b16f61c2b10a9078a618a8.tar.gz -o sources/snapshots/guides.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/rhino.inside/commits/69c582bf7f10735b27ba07afd41e6a70b7a7534f -o sources/snapshots/inside-8-commit.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/rhino.inside/archive/69c582bf7f10735b27ba07afd41e6a70b7a7534f.tar.gz -o sources/snapshots/inside-8.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/rhino.inside-autocad/archive/refs/tags/v1.3.5.tar.gz -o sources/snapshots/inside-autocad-1.3.5.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/rhino.inside-autocad/commits/main -o sources/snapshots/inside-autocad-commit.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino.inside-autocad/releases?per_page=20' -o sources/snapshots/inside-autocad-releases.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/rhino.inside-autocad/git/ref/tags/v1.3.5 -o sources/snapshots/inside-autocad-tag.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino.inside/branches?per_page=100' -o sources/snapshots/inside-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhino.inside/index.json -o sources/snapshots/inside-nuget-versions.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://pypi.org/pypi/rhinoinside/json -o sources/snapshots/inside-pypi.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://files.pythonhosted.org/packages/9d/99/f65101fcd18b5455e224a71f98d340f509a4ba8e59d89bd4f8307f773478/rhinoinside-0.8.2.tar.gz -o sources/snapshots/inside-python-0.8.2.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/rhino.inside-revit/archive/faa6a97653e9da17c6779103ac39537efff60da8.tar.gz -o sources/snapshots/inside-revit-1.35.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/rhino.inside-revit/commits/2292035974e6c4ad919e2ce28deeb698caad8e1a -o sources/snapshots/inside-revit-commit.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://raw.githubusercontent.com/mcneel/rhino.inside-revit/2292035974e6c4ad919e2ce28deeb698caad8e1a/docs/pages/_en/1.0/reference/release-notes.md -o sources/snapshots/inside-revit-release-notes.md
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino.inside-revit/releases?per_page=30' -o sources/snapshots/inside-revit-releases.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino.inside-revit/tags?per_page=100' -o sources/snapshots/inside-revit-tags.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino.inside-revit/git/trees/2292035974e6c4ad919e2ce28deeb698caad8e1a?recursive=1' -o sources/snapshots/inside-revit-tree.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/microsoft.codeanalysis.common/4.14.0/microsoft.codeanalysis.common.4.14.0.nupkg -o sources/snapshots/microsoft.codeanalysis.common.4.14.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/microsoft.codeanalysis.csharp/4.14.0/microsoft.codeanalysis.csharp.4.14.0.nupkg -o sources/snapshots/microsoft.codeanalysis.csharp.4.14.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/microsoft.windowsdesktop.app.ref/7.0.0/microsoft.windowsdesktop.app.ref.7.0.0.nupkg -o sources/snapshots/microsoft.windowsdesktop.app.ref.7.0.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino_sdk_cpp/branches?per_page=100' -o sources/snapshots/native-sdk-repo-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://raw.githubusercontent.com/mcneel/rhino_sdk_cpp/e8f449ea1d7f6c8c2b2bed0dad118cbd68ec8b66/README.md -o sources/snapshots/native-sdk-repo-readme.md
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/developer.rhino3d.com/commits?path=content/en/guides/rhinocommon/moving-to-dotnet-core/index.md&until=2026-01-01T00:00:00Z&per_page=1' -o sources/snapshots/netcore-history.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://raw.githubusercontent.com/mcneel/developer.rhino3d.com/6e4aa57c1598706b3d729384b59cbf55c95615f9/content/en/guides/rhinocommon/moving-to-dotnet-core/index.md -o sources/snapshots/netcore-rhino8.md
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/opennurbs/archive/eb92af3ba1806b0a34a99aba0d3bda83e3d46083.tar.gz -o sources/snapshots/opennurbs-8.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/opennurbs/branches -o sources/snapshots/opennurbs-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/opennurbs/commits/eb92af3ba1806b0a34a99aba0d3bda83e3d46083 -o sources/snapshots/opennurbs-commit.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://files.mcneel.com/dujour/exe/202609/rh835sdk_8.35.26251.13001.msi -o sources/snapshots/rh835sdk_8.35.26251.13001.msi
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/Rhino.Testing/tags?per_page=100' -o sources/snapshots/rhino-testing-tags.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhino.testing/index.json -o sources/snapshots/rhino-testing-versions.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhino.inside/8.0.7-beta/rhino.inside.8.0.7-beta.nupkg -o sources/snapshots/rhino.inside.8.0.7-beta.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhino.testing/8.0.28-beta/rhino.testing.8.0.28-beta.nupkg -o sources/snapshots/rhino.testing.8.0.28-beta.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/rhino3dm/archive/f44a7887955d471ad3e52327a5a410a96aad7957.tar.gz -o sources/snapshots/rhino3dm-8.35.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 'https://api.github.com/repos/mcneel/rhino3dm/tags?per_page=100' -o sources/snapshots/rhino3dm-tags.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhino3dm/8.35.0/rhino3dm.8.35.0.nupkg -o sources/snapshots/rhino3dm.8.35.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhinocommon/8.35.26251.13001/rhinocommon.8.35.26251.13001.nupkg -o sources/snapshots/rhinocommon.8.35.26251.13001.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/RhinoMobile -o sources/snapshots/rhinomobile-repository.json
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/addalias.htm -o sources/snapshots/rhinoscript/application_methods/addalias.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/addsearchpath.htm -o sources/snapshots/rhinoscript/application_methods/addsearchpath.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/addstartupscript.htm -o sources/snapshots/rhinoscript/application_methods/addstartupscript.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/aliascount.htm -o sources/snapshots/rhinoscript/application_methods/aliascount.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/aliasmacro.htm -o sources/snapshots/rhinoscript/application_methods/aliasmacro.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/aliasnames.htm -o sources/snapshots/rhinoscript/application_methods/aliasnames.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/appearancecolor.htm -o sources/snapshots/rhinoscript/application_methods/appearancecolor.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/appearancedisplay.htm -o sources/snapshots/rhinoscript/application_methods/appearancedisplay.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/application_methods.htm -o sources/snapshots/rhinoscript/application_methods/application_methods.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/autosavefile.htm -o sources/snapshots/rhinoscript/application_methods/autosavefile.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/autosaveinterval.htm -o sources/snapshots/rhinoscript/application_methods/autosaveinterval.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/builddate.htm -o sources/snapshots/rhinoscript/application_methods/builddate.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/checknewobjects.htm -o sources/snapshots/rhinoscript/application_methods/checknewobjects.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/clearcommandhistory.htm -o sources/snapshots/rhinoscript/application_methods/clearcommandhistory.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/command.htm -o sources/snapshots/rhinoscript/application_methods/command.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/commandhistory.htm -o sources/snapshots/rhinoscript/application_methods/commandhistory.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/commandlineargs.htm -o sources/snapshots/rhinoscript/application_methods/commandlineargs.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/defaultrenderer.htm -o sources/snapshots/rhinoscript/application_methods/defaultrenderer.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/deletealias.htm -o sources/snapshots/rhinoscript/application_methods/deletealias.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/deletesearchpath.htm -o sources/snapshots/rhinoscript/application_methods/deletesearchpath.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/deletestartupscript.htm -o sources/snapshots/rhinoscript/application_methods/deletestartupscript.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/displayolealerts.htm -o sources/snapshots/rhinoscript/application_methods/displayolealerts.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/edgeanalysiscolor.htm -o sources/snapshots/rhinoscript/application_methods/edgeanalysiscolor.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/edgeanalysismode.htm -o sources/snapshots/rhinoscript/application_methods/edgeanalysismode.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/enableautosave.htm -o sources/snapshots/rhinoscript/application_methods/enableautosave.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/enablehistoryrecording.htm -o sources/snapshots/rhinoscript/application_methods/enablehistoryrecording.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/enableplugin.htm -o sources/snapshots/rhinoscript/application_methods/enableplugin.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/exefolder.htm -o sources/snapshots/rhinoscript/application_methods/exefolder.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/exeplatform.htm -o sources/snapshots/rhinoscript/application_methods/exeplatform.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/exeservicerelease.htm -o sources/snapshots/rhinoscript/application_methods/exeservicerelease.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/exeversion.htm -o sources/snapshots/rhinoscript/application_methods/exeversion.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/exit.htm -o sources/snapshots/rhinoscript/application_methods/exit.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/findfile.htm -o sources/snapshots/rhinoscript/application_methods/findfile.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/getpluginobject.htm -o sources/snapshots/rhinoscript/application_methods/getpluginobject.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/help.htm -o sources/snapshots/rhinoscript/application_methods/help.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/incommand.htm -o sources/snapshots/rhinoscript/application_methods/incommand.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/installfolder.htm -o sources/snapshots/rhinoscript/application_methods/installfolder.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/installtype.htm -o sources/snapshots/rhinoscript/application_methods/installtype.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/isalias.htm -o sources/snapshots/rhinoscript/application_methods/isalias.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/iscommand.htm -o sources/snapshots/rhinoscript/application_methods/iscommand.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/isfullscreen.htm -o sources/snapshots/rhinoscript/application_methods/isfullscreen.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/isocurvedensity.htm -o sources/snapshots/rhinoscript/application_methods/isocurvedensity.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/isplugin.htm -o sources/snapshots/rhinoscript/application_methods/isplugin.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/lastcommandname.htm -o sources/snapshots/rhinoscript/application_methods/lastcommandname.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/lastcommandresult.htm -o sources/snapshots/rhinoscript/application_methods/lastcommandresult.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/lastloadedscriptfile.htm -o sources/snapshots/rhinoscript/application_methods/lastloadedscriptfile.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/localeid.htm -o sources/snapshots/rhinoscript/application_methods/localeid.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/nodetype.htm -o sources/snapshots/rhinoscript/application_methods/nodetype.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/ortho.htm -o sources/snapshots/rhinoscript/application_methods/ortho.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/osnap.htm -o sources/snapshots/rhinoscript/application_methods/osnap.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/osnapdialog.htm -o sources/snapshots/rhinoscript/application_methods/osnapdialog.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/osnapmode.htm -o sources/snapshots/rhinoscript/application_methods/osnapmode.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/planar.htm -o sources/snapshots/rhinoscript/application_methods/planar.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/pluginid.htm -o sources/snapshots/rhinoscript/application_methods/pluginid.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/pluginids.htm -o sources/snapshots/rhinoscript/application_methods/pluginids.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/plugininfo.htm -o sources/snapshots/rhinoscript/application_methods/plugininfo.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/pluginname.htm -o sources/snapshots/rhinoscript/application_methods/pluginname.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/plugins.htm -o sources/snapshots/rhinoscript/application_methods/plugins.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/print.htm -o sources/snapshots/rhinoscript/application_methods/print.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/printex.htm -o sources/snapshots/rhinoscript/application_methods/printex.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/projectosnaps.htm -o sources/snapshots/rhinoscript/application_methods/projectosnaps.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/prompt.htm -o sources/snapshots/rhinoscript/application_methods/prompt.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/promptmessage.htm -o sources/snapshots/rhinoscript/application_methods/promptmessage.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/recentfiles.htm -o sources/snapshots/rhinoscript/application_methods/recentfiles.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/registrykey.htm -o sources/snapshots/rhinoscript/application_methods/registrykey.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/screensize.htm -o sources/snapshots/rhinoscript/application_methods/screensize.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/sdkservicerelease.htm -o sources/snapshots/rhinoscript/application_methods/sdkservicerelease.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/sdkversion.htm -o sources/snapshots/rhinoscript/application_methods/sdkversion.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/searchpathcount.htm -o sources/snapshots/rhinoscript/application_methods/searchpathcount.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/searchpathlist.htm -o sources/snapshots/rhinoscript/application_methods/searchpathlist.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/sendkeystrokes.htm -o sources/snapshots/rhinoscript/application_methods/sendkeystrokes.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/serialnumber.htm -o sources/snapshots/rhinoscript/application_methods/serialnumber.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/showisocurves.htm -o sources/snapshots/rhinoscript/application_methods/showisocurves.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/snap.htm -o sources/snapshots/rhinoscript/application_methods/snap.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/snaptolocked.htm -o sources/snapshots/rhinoscript/application_methods/snaptolocked.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/startupscriptcount.htm -o sources/snapshots/rhinoscript/application_methods/startupscriptcount.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/startupscriptlist.htm -o sources/snapshots/rhinoscript/application_methods/startupscriptlist.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/statusbardistance.htm -o sources/snapshots/rhinoscript/application_methods/statusbardistance.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/statusbarmessage.htm -o sources/snapshots/rhinoscript/application_methods/statusbarmessage.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/statusbarnumber.htm -o sources/snapshots/rhinoscript/application_methods/statusbarnumber.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/statusbarpoint.htm -o sources/snapshots/rhinoscript/application_methods/statusbarpoint.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/statusbarprogressmeter.htm -o sources/snapshots/rhinoscript/application_methods/statusbarprogressmeter.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/templatefile.htm -o sources/snapshots/rhinoscript/application_methods/templatefile.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/templatefolder.htm -o sources/snapshots/rhinoscript/application_methods/templatefolder.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/uplanemode.htm -o sources/snapshots/rhinoscript/application_methods/uplanemode.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/windowhandle.htm -o sources/snapshots/rhinoscript/application_methods/windowhandle.htm
mkdir -p sources/snapshots/rhinoscript/application_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/application_methods/workingfolder.htm -o sources/snapshots/rhinoscript/application_methods/workingfolder.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/addblock.htm -o sources/snapshots/rhinoscript/block_methods/addblock.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/block_methods.htm -o sources/snapshots/rhinoscript/block_methods/block_methods.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockcontainercount.htm -o sources/snapshots/rhinoscript/block_methods/blockcontainercount.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockcontainers.htm -o sources/snapshots/rhinoscript/block_methods/blockcontainers.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockcount.htm -o sources/snapshots/rhinoscript/block_methods/blockcount.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockdescription.htm -o sources/snapshots/rhinoscript/block_methods/blockdescription.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockids.htm -o sources/snapshots/rhinoscript/block_methods/blockids.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstancecount.htm -o sources/snapshots/rhinoscript/block_methods/blockinstancecount.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstanceid.htm -o sources/snapshots/rhinoscript/block_methods/blockinstanceid.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstanceinsertpoint.htm -o sources/snapshots/rhinoscript/block_methods/blockinstanceinsertpoint.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstancename.htm -o sources/snapshots/rhinoscript/block_methods/blockinstancename.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstances.htm -o sources/snapshots/rhinoscript/block_methods/blockinstances.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockinstancexform.htm -o sources/snapshots/rhinoscript/block_methods/blockinstancexform.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockname.htm -o sources/snapshots/rhinoscript/block_methods/blockname.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blocknames.htm -o sources/snapshots/rhinoscript/block_methods/blocknames.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockobjectcount.htm -o sources/snapshots/rhinoscript/block_methods/blockobjectcount.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockobjects.htm -o sources/snapshots/rhinoscript/block_methods/blockobjects.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockpath.htm -o sources/snapshots/rhinoscript/block_methods/blockpath.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockstatus.htm -o sources/snapshots/rhinoscript/block_methods/blockstatus.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blocktype.htm -o sources/snapshots/rhinoscript/block_methods/blocktype.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockurl.htm -o sources/snapshots/rhinoscript/block_methods/blockurl.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/blockurltag.htm -o sources/snapshots/rhinoscript/block_methods/blockurltag.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/deleteblock.htm -o sources/snapshots/rhinoscript/block_methods/deleteblock.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/explodeblockinstance.htm -o sources/snapshots/rhinoscript/block_methods/explodeblockinstance.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/insertblock.htm -o sources/snapshots/rhinoscript/block_methods/insertblock.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblock.htm -o sources/snapshots/rhinoscript/block_methods/isblock.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblockembedded.htm -o sources/snapshots/rhinoscript/block_methods/isblockembedded.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblockinstance.htm -o sources/snapshots/rhinoscript/block_methods/isblockinstance.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblockinuse.htm -o sources/snapshots/rhinoscript/block_methods/isblockinuse.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblockobject.htm -o sources/snapshots/rhinoscript/block_methods/isblockobject.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/isblockreference.htm -o sources/snapshots/rhinoscript/block_methods/isblockreference.htm
mkdir -p sources/snapshots/rhinoscript/block_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/block_methods/renameblock.htm -o sources/snapshots/rhinoscript/block_methods/renameblock.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addarc.htm -o sources/snapshots/rhinoscript/curve_methods/addarc.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addarcpttanpt.htm -o sources/snapshots/rhinoscript/curve_methods/addarcpttanpt.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addblendcurve.htm -o sources/snapshots/rhinoscript/curve_methods/addblendcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcircle.htm -o sources/snapshots/rhinoscript/curve_methods/addcircle.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcircle3pt.htm -o sources/snapshots/rhinoscript/curve_methods/addcircle3pt.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcirclepttanpt.htm -o sources/snapshots/rhinoscript/curve_methods/addcirclepttanpt.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcircletantan.htm -o sources/snapshots/rhinoscript/curve_methods/addcircletantan.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcircletantantan.htm -o sources/snapshots/rhinoscript/curve_methods/addcircletantantan.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addcurve.htm -o sources/snapshots/rhinoscript/curve_methods/addcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addellipse.htm -o sources/snapshots/rhinoscript/curve_methods/addellipse.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addellipse3pt.htm -o sources/snapshots/rhinoscript/curve_methods/addellipse3pt.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addfilletcurve.htm -o sources/snapshots/rhinoscript/curve_methods/addfilletcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addinterpcrvonsrf.htm -o sources/snapshots/rhinoscript/curve_methods/addinterpcrvonsrf.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addinterpcrvonsrfuv.htm -o sources/snapshots/rhinoscript/curve_methods/addinterpcrvonsrfuv.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addinterpcurve.htm -o sources/snapshots/rhinoscript/curve_methods/addinterpcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addinterpcurveex.htm -o sources/snapshots/rhinoscript/curve_methods/addinterpcurveex.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addline.htm -o sources/snapshots/rhinoscript/curve_methods/addline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addnurbscurve.htm -o sources/snapshots/rhinoscript/curve_methods/addnurbscurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addpolygon.htm -o sources/snapshots/rhinoscript/curve_methods/addpolygon.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addpolyline.htm -o sources/snapshots/rhinoscript/curve_methods/addpolyline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addspiral.htm -o sources/snapshots/rhinoscript/curve_methods/addspiral.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addspiral2.htm -o sources/snapshots/rhinoscript/curve_methods/addspiral2.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addstarpolygon.htm -o sources/snapshots/rhinoscript/curve_methods/addstarpolygon.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addsubcrv.htm -o sources/snapshots/rhinoscript/curve_methods/addsubcrv.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/addtextoutlines.htm -o sources/snapshots/rhinoscript/curve_methods/addtextoutlines.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/arcangle.htm -o sources/snapshots/rhinoscript/curve_methods/arcangle.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/arccenterpoint.htm -o sources/snapshots/rhinoscript/curve_methods/arccenterpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/arcmidpoint.htm -o sources/snapshots/rhinoscript/curve_methods/arcmidpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/arcradius.htm -o sources/snapshots/rhinoscript/curve_methods/arcradius.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/changecurvedegree.htm -o sources/snapshots/rhinoscript/curve_methods/changecurvedegree.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/circlecenterpoint.htm -o sources/snapshots/rhinoscript/curve_methods/circlecenterpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/circlecircumference.htm -o sources/snapshots/rhinoscript/curve_methods/circlecircumference.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/circleradius.htm -o sources/snapshots/rhinoscript/curve_methods/circleradius.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/cleanuppolycurve.htm -o sources/snapshots/rhinoscript/curve_methods/cleanuppolycurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/closecurve.htm -o sources/snapshots/rhinoscript/curve_methods/closecurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/closedcurveorientation.htm -o sources/snapshots/rhinoscript/curve_methods/closedcurveorientation.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/convertcurvetobezier.htm -o sources/snapshots/rhinoscript/curve_methods/convertcurvetobezier.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/convertcurvetopolyline.htm -o sources/snapshots/rhinoscript/curve_methods/convertcurvetopolyline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curve_addarc3pt.htm -o sources/snapshots/rhinoscript/curve_methods/curve_addarc3pt.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curve_methods.htm -o sources/snapshots/rhinoscript/curve_methods/curve_methods.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvearclengthpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curvearclengthpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvearea.htm -o sources/snapshots/rhinoscript/curve_methods/curvearea.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveareacentroid.htm -o sources/snapshots/rhinoscript/curve_methods/curveareacentroid.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvearrows.htm -o sources/snapshots/rhinoscript/curve_methods/curvearrows.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvebooleandifference.htm -o sources/snapshots/rhinoscript/curve_methods/curvebooleandifference.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvebooleanintersection.htm -o sources/snapshots/rhinoscript/curve_methods/curvebooleanintersection.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvebooleanunion.htm -o sources/snapshots/rhinoscript/curve_methods/curvebooleanunion.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvebrepintersect.htm -o sources/snapshots/rhinoscript/curve_methods/curvebrepintersect.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveclosestobject.htm -o sources/snapshots/rhinoscript/curve_methods/curveclosestobject.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveclosestpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curveclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvecontourpoints.htm -o sources/snapshots/rhinoscript/curve_methods/curvecontourpoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvecurvature.htm -o sources/snapshots/rhinoscript/curve_methods/curvecurvature.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvecurveintersection.htm -o sources/snapshots/rhinoscript/curve_methods/curvecurveintersection.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvedegree.htm -o sources/snapshots/rhinoscript/curve_methods/curvedegree.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvedeviation.htm -o sources/snapshots/rhinoscript/curve_methods/curvedeviation.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvedim.htm -o sources/snapshots/rhinoscript/curve_methods/curvedim.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvedirectionsmatch.htm -o sources/snapshots/rhinoscript/curve_methods/curvedirectionsmatch.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvediscontinuity.htm -o sources/snapshots/rhinoscript/curve_methods/curvediscontinuity.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvedomain.htm -o sources/snapshots/rhinoscript/curve_methods/curvedomain.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveeditpoints.htm -o sources/snapshots/rhinoscript/curve_methods/curveeditpoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveendpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curveendpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveevaluate.htm -o sources/snapshots/rhinoscript/curve_methods/curveevaluate.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveextremepoints.htm -o sources/snapshots/rhinoscript/curve_methods/curveextremepoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvefilletcorners.htm -o sources/snapshots/rhinoscript/curve_methods/curvefilletcorners.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvefilletpoints.htm -o sources/snapshots/rhinoscript/curve_methods/curvefilletpoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveframe.htm -o sources/snapshots/rhinoscript/curve_methods/curveframe.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveknotcount.htm -o sources/snapshots/rhinoscript/curve_methods/curveknotcount.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveknots.htm -o sources/snapshots/rhinoscript/curve_methods/curveknots.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvelength.htm -o sources/snapshots/rhinoscript/curve_methods/curvelength.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvemidpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curvemidpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvenormal.htm -o sources/snapshots/rhinoscript/curve_methods/curvenormal.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvenormalizedparameter.htm -o sources/snapshots/rhinoscript/curve_methods/curvenormalizedparameter.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveparameter.htm -o sources/snapshots/rhinoscript/curve_methods/curveparameter.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveperpframe.htm -o sources/snapshots/rhinoscript/curve_methods/curveperpframe.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveperppoint.htm -o sources/snapshots/rhinoscript/curve_methods/curveperppoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveplane.htm -o sources/snapshots/rhinoscript/curve_methods/curveplane.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvepointcount.htm -o sources/snapshots/rhinoscript/curve_methods/curvepointcount.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvepoints.htm -o sources/snapshots/rhinoscript/curve_methods/curvepoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveradius.htm -o sources/snapshots/rhinoscript/curve_methods/curveradius.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curverailframes.htm -o sources/snapshots/rhinoscript/curve_methods/curverailframes.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveseam.htm -o sources/snapshots/rhinoscript/curve_methods/curveseam.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvestartpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curvestartpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvesurfaceintersection.htm -o sources/snapshots/rhinoscript/curve_methods/curvesurfaceintersection.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvetangent.htm -o sources/snapshots/rhinoscript/curve_methods/curvetangent.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curvetangentpoint.htm -o sources/snapshots/rhinoscript/curve_methods/curvetangentpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/curveweights.htm -o sources/snapshots/rhinoscript/curve_methods/curveweights.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/dividecurve.htm -o sources/snapshots/rhinoscript/curve_methods/dividecurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/dividecurveequidistant.htm -o sources/snapshots/rhinoscript/curve_methods/dividecurveequidistant.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/dividecurvelength.htm -o sources/snapshots/rhinoscript/curve_methods/dividecurvelength.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ellipsecenterpoint.htm -o sources/snapshots/rhinoscript/curve_methods/ellipsecenterpoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ellipsefocaldistance.htm -o sources/snapshots/rhinoscript/curve_methods/ellipsefocaldistance.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ellipsefoci.htm -o sources/snapshots/rhinoscript/curve_methods/ellipsefoci.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ellipsequadpoints.htm -o sources/snapshots/rhinoscript/curve_methods/ellipsequadpoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/evaluatecurve.htm -o sources/snapshots/rhinoscript/curve_methods/evaluatecurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/explodecurves.htm -o sources/snapshots/rhinoscript/curve_methods/explodecurves.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/extendcurve.htm -o sources/snapshots/rhinoscript/curve_methods/extendcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/extendcurvelength.htm -o sources/snapshots/rhinoscript/curve_methods/extendcurvelength.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/extendcurvepoint.htm -o sources/snapshots/rhinoscript/curve_methods/extendcurvepoint.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/extractpolycurvesegment.htm -o sources/snapshots/rhinoscript/curve_methods/extractpolycurvesegment.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/faircurve.htm -o sources/snapshots/rhinoscript/curve_methods/faircurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/filletcurves.htm -o sources/snapshots/rhinoscript/curve_methods/filletcurves.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/fitcurve.htm -o sources/snapshots/rhinoscript/curve_methods/fitcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/insertcurveknot.htm -o sources/snapshots/rhinoscript/curve_methods/insertcurveknot.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/isarc.htm -o sources/snapshots/rhinoscript/curve_methods/isarc.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscircle.htm -o sources/snapshots/rhinoscript/curve_methods/iscircle.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurve.htm -o sources/snapshots/rhinoscript/curve_methods/iscurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveclosable.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveclosable.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveclosed.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveclosed.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveconicsection.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveconicsection.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveinplane.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveinplane.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurvelinear.htm -o sources/snapshots/rhinoscript/curve_methods/iscurvelinear.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveperiodic.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveperiodic.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurveplanar.htm -o sources/snapshots/rhinoscript/curve_methods/iscurveplanar.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/iscurverational.htm -o sources/snapshots/rhinoscript/curve_methods/iscurverational.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/isellipse.htm -o sources/snapshots/rhinoscript/curve_methods/isellipse.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/isellipticalarc.htm -o sources/snapshots/rhinoscript/curve_methods/isellipticalarc.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/isline.htm -o sources/snapshots/rhinoscript/curve_methods/isline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/isnurbscurve.htm -o sources/snapshots/rhinoscript/curve_methods/isnurbscurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ispointoncurve.htm -o sources/snapshots/rhinoscript/curve_methods/ispointoncurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ispolycurve.htm -o sources/snapshots/rhinoscript/curve_methods/ispolycurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/ispolyline.htm -o sources/snapshots/rhinoscript/curve_methods/ispolyline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/joincurves.htm -o sources/snapshots/rhinoscript/curve_methods/joincurves.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/linefitfrompoints.htm -o sources/snapshots/rhinoscript/curve_methods/linefitfrompoints.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/makecurvenonperiodic.htm -o sources/snapshots/rhinoscript/curve_methods/makecurvenonperiodic.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/makecurveperiodic.htm -o sources/snapshots/rhinoscript/curve_methods/makecurveperiodic.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/meancurve.htm -o sources/snapshots/rhinoscript/curve_methods/meancurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/meshpolyline.htm -o sources/snapshots/rhinoscript/curve_methods/meshpolyline.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/offsetcurve.htm -o sources/snapshots/rhinoscript/curve_methods/offsetcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/offsetcurvenormal.htm -o sources/snapshots/rhinoscript/curve_methods/offsetcurvenormal.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/offsetcurveonsurface.htm -o sources/snapshots/rhinoscript/curve_methods/offsetcurveonsurface.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/planarclosedcurvecontainment.htm -o sources/snapshots/rhinoscript/curve_methods/planarclosedcurvecontainment.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/planarcurvecollision.htm -o sources/snapshots/rhinoscript/curve_methods/planarcurvecollision.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/pointinplanarclosedcurve.htm -o sources/snapshots/rhinoscript/curve_methods/pointinplanarclosedcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/polycurvecount.htm -o sources/snapshots/rhinoscript/curve_methods/polycurvecount.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/polylinevertices.htm -o sources/snapshots/rhinoscript/curve_methods/polylinevertices.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/projectcurvetomesh.htm -o sources/snapshots/rhinoscript/curve_methods/projectcurvetomesh.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/projectcurvetosurface.htm -o sources/snapshots/rhinoscript/curve_methods/projectcurvetosurface.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/rebuildcurve.htm -o sources/snapshots/rhinoscript/curve_methods/rebuildcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/removecurveknot.htm -o sources/snapshots/rhinoscript/curve_methods/removecurveknot.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/removeshortcurvesegments.htm -o sources/snapshots/rhinoscript/curve_methods/removeshortcurvesegments.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/reversecurve.htm -o sources/snapshots/rhinoscript/curve_methods/reversecurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/simplifycurve.htm -o sources/snapshots/rhinoscript/curve_methods/simplifycurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/smoothcurve.htm -o sources/snapshots/rhinoscript/curve_methods/smoothcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/softeditcurve.htm -o sources/snapshots/rhinoscript/curve_methods/softeditcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/splitcurve.htm -o sources/snapshots/rhinoscript/curve_methods/splitcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/trimcurve.htm -o sources/snapshots/rhinoscript/curve_methods/trimcurve.htm
mkdir -p sources/snapshots/rhinoscript/curve_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/curve_methods/tweencurve.htm -o sources/snapshots/rhinoscript/curve_methods/tweencurve.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/addaligneddimension.htm -o sources/snapshots/rhinoscript/dimension_methods/addaligneddimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/adddimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/adddimstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/addleader.htm -o sources/snapshots/rhinoscript/dimension_methods/addleader.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/addlineardimension.htm -o sources/snapshots/rhinoscript/dimension_methods/addlineardimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/addradialdimension.htm -o sources/snapshots/rhinoscript/dimension_methods/addradialdimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/currentdimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/currentdimstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/deletedimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/deletedimstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimension_methods.htm -o sources/snapshots/rhinoscript/dimension_methods/dimension_methods.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimensionstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/dimensionstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimensiontext.htm -o sources/snapshots/rhinoscript/dimension_methods/dimensiontext.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimensionusertext.htm -o sources/snapshots/rhinoscript/dimension_methods/dimensionusertext.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimensionvalue.htm -o sources/snapshots/rhinoscript/dimension_methods/dimensionvalue.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyleangleprecision.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyleangleprecision.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylearrowsize.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylearrowsize.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylecentermarksize.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylecentermarksize.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylecount.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylecount.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyledimlineextension.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyledimlineextension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyleextension.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyleextension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylefieldoverride.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylefieldoverride.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylefont.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylefont.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyleleaderarrowsize.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyleleaderarrowsize.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylelengthfactor.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylelengthfactor.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylelinearprecision.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylelinearprecision.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylenames.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylenames.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylenumberformat.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylenumberformat.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyleoffset.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyleoffset.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyleprefix.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyleprefix.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylescale.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylescale.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstylesuffix.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstylesuffix.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyletextalignment.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyletextalignment.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyletextgap.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyletextgap.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/dimstyletextheight.htm -o sources/snapshots/rhinoscript/dimension_methods/dimstyletextheight.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isaligneddimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isaligneddimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isangulardimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isangulardimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isdiameterdimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isdiameterdimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isdimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isdimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isdimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/isdimstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isdimstylechild.htm -o sources/snapshots/rhinoscript/dimension_methods/isdimstylechild.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isdimstylereference.htm -o sources/snapshots/rhinoscript/dimension_methods/isdimstylereference.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isleader.htm -o sources/snapshots/rhinoscript/dimension_methods/isleader.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/islineardimension.htm -o sources/snapshots/rhinoscript/dimension_methods/islineardimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isordinatedimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isordinatedimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/isradialdimension.htm -o sources/snapshots/rhinoscript/dimension_methods/isradialdimension.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/leadertext.htm -o sources/snapshots/rhinoscript/dimension_methods/leadertext.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/parentdimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/parentdimstyle.htm
mkdir -p sources/snapshots/rhinoscript/dimension_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/dimension_methods/renamedimstyle.htm -o sources/snapshots/rhinoscript/dimension_methods/renamedimstyle.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/createpreviewimage.htm -o sources/snapshots/rhinoscript/document_methods/createpreviewimage.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/document_methods.htm -o sources/snapshots/rhinoscript/document_methods/document_methods.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/documentinfo.htm -o sources/snapshots/rhinoscript/document_methods/documentinfo.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/documentmodified.htm -o sources/snapshots/rhinoscript/document_methods/documentmodified.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/documentname.htm -o sources/snapshots/rhinoscript/document_methods/documentname.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/documentpath.htm -o sources/snapshots/rhinoscript/document_methods/documentpath.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/documenturl.htm -o sources/snapshots/rhinoscript/document_methods/documenturl.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/enablemodelspacehatchscale.htm -o sources/snapshots/rhinoscript/document_methods/enablemodelspacehatchscale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/enablemodelspacetextscale.htm -o sources/snapshots/rhinoscript/document_methods/enablemodelspacetextscale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/enableredraw.htm -o sources/snapshots/rhinoscript/document_methods/enableredraw.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/extractpreviewimage.htm -o sources/snapshots/rhinoscript/document_methods/extractpreviewimage.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/isdocumentmodified.htm -o sources/snapshots/rhinoscript/document_methods/isdocumentmodified.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/modelspacehatchscale.htm -o sources/snapshots/rhinoscript/document_methods/modelspacehatchscale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/modelspacelinetypescale.htm -o sources/snapshots/rhinoscript/document_methods/modelspacelinetypescale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/modelspacetextscale.htm -o sources/snapshots/rhinoscript/document_methods/modelspacetextscale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/notes.htm -o sources/snapshots/rhinoscript/document_methods/notes.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/readfileversion.htm -o sources/snapshots/rhinoscript/document_methods/readfileversion.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/redraw.htm -o sources/snapshots/rhinoscript/document_methods/redraw.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/renderantialias.htm -o sources/snapshots/rhinoscript/document_methods/renderantialias.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendercolor.htm -o sources/snapshots/rhinoscript/document_methods/rendercolor.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshdensity.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshdensity.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshmaxangle.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshmaxangle.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshmaxaspectratio.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshmaxaspectratio.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshmaxdistedgetosrf.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshmaxdistedgetosrf.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshmaxedgelength.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshmaxedgelength.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshminedgelength.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshminedgelength.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshmininitialgridquads.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshmininitialgridquads.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshquality.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshquality.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendermeshsettings.htm -o sources/snapshots/rhinoscript/document_methods/rendermeshsettings.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/renderresolution.htm -o sources/snapshots/rhinoscript/document_methods/renderresolution.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/rendersettings.htm -o sources/snapshots/rhinoscript/document_methods/rendersettings.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitabsolutetolerance.htm -o sources/snapshots/rhinoscript/document_methods/unitabsolutetolerance.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitangletolerance.htm -o sources/snapshots/rhinoscript/document_methods/unitangletolerance.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitcustomunitsystem.htm -o sources/snapshots/rhinoscript/document_methods/unitcustomunitsystem.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitdistancedisplaymode.htm -o sources/snapshots/rhinoscript/document_methods/unitdistancedisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitdistancedisplayprecision.htm -o sources/snapshots/rhinoscript/document_methods/unitdistancedisplayprecision.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitrelativetolerance.htm -o sources/snapshots/rhinoscript/document_methods/unitrelativetolerance.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitscale.htm -o sources/snapshots/rhinoscript/document_methods/unitscale.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitsystem.htm -o sources/snapshots/rhinoscript/document_methods/unitsystem.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/unitsystemname.htm -o sources/snapshots/rhinoscript/document_methods/unitsystemname.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/worksessionfilename.htm -o sources/snapshots/rhinoscript/document_methods/worksessionfilename.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/worksessionmodelaliases.htm -o sources/snapshots/rhinoscript/document_methods/worksessionmodelaliases.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/worksessionmodelcount.htm -o sources/snapshots/rhinoscript/document_methods/worksessionmodelcount.htm
mkdir -p sources/snapshots/rhinoscript/document_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/document_methods/worksessionmodelnames.htm -o sources/snapshots/rhinoscript/document_methods/worksessionmodelnames.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addclippingplane.htm -o sources/snapshots/rhinoscript/geometry_methods/addclippingplane.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addpictureframe.htm -o sources/snapshots/rhinoscript/geometry_methods/addpictureframe.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addpoint.htm -o sources/snapshots/rhinoscript/geometry_methods/addpoint.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addpointcloud.htm -o sources/snapshots/rhinoscript/geometry_methods/addpointcloud.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addpoints.htm -o sources/snapshots/rhinoscript/geometry_methods/addpoints.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addtext.htm -o sources/snapshots/rhinoscript/geometry_methods/addtext.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/addtextdot.htm -o sources/snapshots/rhinoscript/geometry_methods/addtextdot.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/boundingbox.htm -o sources/snapshots/rhinoscript/geometry_methods/boundingbox.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/circlefrompoints.htm -o sources/snapshots/rhinoscript/geometry_methods/circlefrompoints.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/clippingplanedefinition.htm -o sources/snapshots/rhinoscript/geometry_methods/clippingplanedefinition.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/clippingplaneview.htm -o sources/snapshots/rhinoscript/geometry_methods/clippingplaneview.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/comparegeometry.htm -o sources/snapshots/rhinoscript/geometry_methods/comparegeometry.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/flipclippingplane.htm -o sources/snapshots/rhinoscript/geometry_methods/flipclippingplane.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/geometry_methods.htm -o sources/snapshots/rhinoscript/geometry_methods/geometry_methods.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/isclippingplane.htm -o sources/snapshots/rhinoscript/geometry_methods/isclippingplane.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/isknotvectorclamped.htm -o sources/snapshots/rhinoscript/geometry_methods/isknotvectorclamped.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/isknotvectorperiodic.htm -o sources/snapshots/rhinoscript/geometry_methods/isknotvectorperiodic.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/isknotvectoruniform.htm -o sources/snapshots/rhinoscript/geometry_methods/isknotvectoruniform.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/ispictureframe.htm -o sources/snapshots/rhinoscript/geometry_methods/ispictureframe.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/ispoint.htm -o sources/snapshots/rhinoscript/geometry_methods/ispoint.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/ispointcloud.htm -o sources/snapshots/rhinoscript/geometry_methods/ispointcloud.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/istext.htm -o sources/snapshots/rhinoscript/geometry_methods/istext.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/istextdot.htm -o sources/snapshots/rhinoscript/geometry_methods/istextdot.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/knotvectorhasbezierspans.htm -o sources/snapshots/rhinoscript/geometry_methods/knotvectorhasbezierspans.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/knotvectorstyle.htm -o sources/snapshots/rhinoscript/geometry_methods/knotvectorstyle.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudcount.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudcount.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudhashiddenpoints.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudhashiddenpoints.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudhaspointcolors.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudhaspointcolors.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudhidepoints.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudhidepoints.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudpointcolors.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudpointcolors.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcloudpoints.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcloudpoints.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/pointcoordinates.htm -o sources/snapshots/rhinoscript/geometry_methods/pointcoordinates.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textdotfont.htm -o sources/snapshots/rhinoscript/geometry_methods/textdotfont.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textdotheight.htm -o sources/snapshots/rhinoscript/geometry_methods/textdotheight.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textdotpoint.htm -o sources/snapshots/rhinoscript/geometry_methods/textdotpoint.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textdottext.htm -o sources/snapshots/rhinoscript/geometry_methods/textdottext.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectfont.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectfont.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectformula.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectformula.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectheight.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectheight.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectjustification.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectjustification.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectmask.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectmask.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectplane.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectplane.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectpoint.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectpoint.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjectstyle.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjectstyle.htm
mkdir -p sources/snapshots/rhinoscript/geometry_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/geometry_methods/textobjecttext.htm -o sources/snapshots/rhinoscript/geometry_methods/textobjecttext.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/addgroup.htm -o sources/snapshots/rhinoscript/group_methods/addgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/addobjectstogroup.htm -o sources/snapshots/rhinoscript/group_methods/addobjectstogroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/addobjecttogroup.htm -o sources/snapshots/rhinoscript/group_methods/addobjecttogroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/deletegroup.htm -o sources/snapshots/rhinoscript/group_methods/deletegroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/getgroupusertext.htm -o sources/snapshots/rhinoscript/group_methods/getgroupusertext.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/group_methods.htm -o sources/snapshots/rhinoscript/group_methods/group_methods.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/groupcount.htm -o sources/snapshots/rhinoscript/group_methods/groupcount.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/groupnames.htm -o sources/snapshots/rhinoscript/group_methods/groupnames.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/hidegroup.htm -o sources/snapshots/rhinoscript/group_methods/hidegroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/isgroup.htm -o sources/snapshots/rhinoscript/group_methods/isgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/isgroupempty.htm -o sources/snapshots/rhinoscript/group_methods/isgroupempty.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/lockgroup.htm -o sources/snapshots/rhinoscript/group_methods/lockgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/removeobjectfromallgroups.htm -o sources/snapshots/rhinoscript/group_methods/removeobjectfromallgroups.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/removeobjectfromgroup.htm -o sources/snapshots/rhinoscript/group_methods/removeobjectfromgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/removeobjectfromtopgroup.htm -o sources/snapshots/rhinoscript/group_methods/removeobjectfromtopgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/removeobjectsfromgroup.htm -o sources/snapshots/rhinoscript/group_methods/removeobjectsfromgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/renamegroup.htm -o sources/snapshots/rhinoscript/group_methods/renamegroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/setgroupusertext.htm -o sources/snapshots/rhinoscript/group_methods/setgroupusertext.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/showgroup.htm -o sources/snapshots/rhinoscript/group_methods/showgroup.htm
mkdir -p sources/snapshots/rhinoscript/group_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/group_methods/unlockgroup.htm -o sources/snapshots/rhinoscript/group_methods/unlockgroup.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/addhatch.htm -o sources/snapshots/rhinoscript/hatch_methods/addhatch.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/addhatches.htm -o sources/snapshots/rhinoscript/hatch_methods/addhatches.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/addhatchpatterns.htm -o sources/snapshots/rhinoscript/hatch_methods/addhatchpatterns.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/currenthatchpattern.htm -o sources/snapshots/rhinoscript/hatch_methods/currenthatchpattern.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/duplicatehatchborders.htm -o sources/snapshots/rhinoscript/hatch_methods/duplicatehatchborders.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/explodehatch.htm -o sources/snapshots/rhinoscript/hatch_methods/explodehatch.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatch_methods.htm -o sources/snapshots/rhinoscript/hatch_methods/hatch_methods.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatcharea.htm -o sources/snapshots/rhinoscript/hatch_methods/hatcharea.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchpattern.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchpattern.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchpatterncount.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchpatterncount.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchpatterndescription.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchpatterndescription.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchpatternfilltype.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchpatternfilltype.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchpatternnames.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchpatternnames.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchrotation.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchrotation.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/hatchscale.htm -o sources/snapshots/rhinoscript/hatch_methods/hatchscale.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/ishatch.htm -o sources/snapshots/rhinoscript/hatch_methods/ishatch.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/ishatchpattern.htm -o sources/snapshots/rhinoscript/hatch_methods/ishatchpattern.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/ishatchpatterncurrent.htm -o sources/snapshots/rhinoscript/hatch_methods/ishatchpatterncurrent.htm
mkdir -p sources/snapshots/rhinoscript/hatch_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/hatch_methods/ishatchpatternreference.htm -o sources/snapshots/rhinoscript/hatch_methods/ishatchpatternreference.htm
mkdir -p sources/snapshots/rhinoscript
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction.htm -o sources/snapshots/rhinoscript/introduction.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/cancelling_scripts.htm -o sources/snapshots/rhinoscript/introduction/cancelling_scripts.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/editing_scripts.htm -o sources/snapshots/rhinoscript/introduction/editing_scripts.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/external_access.htm -o sources/snapshots/rhinoscript/introduction/external_access.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/getting_started.htm -o sources/snapshots/rhinoscript/introduction/getting_started.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/loading_scripts.htm -o sources/snapshots/rhinoscript/introduction/loading_scripts.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/reinitializing_rhinoscript.htm -o sources/snapshots/rhinoscript/introduction/reinitializing_rhinoscript.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/running_scripts.htm -o sources/snapshots/rhinoscript/introduction/running_scripts.htm
mkdir -p sources/snapshots/rhinoscript/introduction
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/introduction/scripting_options.htm -o sources/snapshots/rhinoscript/introduction/scripting_options.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/addlayer.htm -o sources/snapshots/rhinoscript/layer_methods/addlayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/currentlayer.htm -o sources/snapshots/rhinoscript/layer_methods/currentlayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/deletelayer.htm -o sources/snapshots/rhinoscript/layer_methods/deletelayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/expandlayer.htm -o sources/snapshots/rhinoscript/layer_methods/expandlayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/getlayerusertext.htm -o sources/snapshots/rhinoscript/layer_methods/getlayerusertext.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayer.htm -o sources/snapshots/rhinoscript/layer_methods/islayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerchangeable.htm -o sources/snapshots/rhinoscript/layer_methods/islayerchangeable.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerchildof.htm -o sources/snapshots/rhinoscript/layer_methods/islayerchildof.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayercurrent.htm -o sources/snapshots/rhinoscript/layer_methods/islayercurrent.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerempty.htm -o sources/snapshots/rhinoscript/layer_methods/islayerempty.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerexpanded.htm -o sources/snapshots/rhinoscript/layer_methods/islayerexpanded.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerlocked.htm -o sources/snapshots/rhinoscript/layer_methods/islayerlocked.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayeron.htm -o sources/snapshots/rhinoscript/layer_methods/islayeron.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerparentof.htm -o sources/snapshots/rhinoscript/layer_methods/islayerparentof.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerreference.htm -o sources/snapshots/rhinoscript/layer_methods/islayerreference.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayerselectable.htm -o sources/snapshots/rhinoscript/layer_methods/islayerselectable.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/islayervisible.htm -o sources/snapshots/rhinoscript/layer_methods/islayervisible.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layer_methods.htm -o sources/snapshots/rhinoscript/layer_methods/layer_methods.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerchildcount.htm -o sources/snapshots/rhinoscript/layer_methods/layerchildcount.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerchildren.htm -o sources/snapshots/rhinoscript/layer_methods/layerchildren.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layercolor.htm -o sources/snapshots/rhinoscript/layer_methods/layercolor.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layercount.htm -o sources/snapshots/rhinoscript/layer_methods/layercount.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerid.htm -o sources/snapshots/rhinoscript/layer_methods/layerid.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerids.htm -o sources/snapshots/rhinoscript/layer_methods/layerids.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerlinetype.htm -o sources/snapshots/rhinoscript/layer_methods/layerlinetype.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerlocked.htm -o sources/snapshots/rhinoscript/layer_methods/layerlocked.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layermaterialindex.htm -o sources/snapshots/rhinoscript/layer_methods/layermaterialindex.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layermode.htm -o sources/snapshots/rhinoscript/layer_methods/layermode.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layername.htm -o sources/snapshots/rhinoscript/layer_methods/layername.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layernames.htm -o sources/snapshots/rhinoscript/layer_methods/layernames.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerorder.htm -o sources/snapshots/rhinoscript/layer_methods/layerorder.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerprintcolor.htm -o sources/snapshots/rhinoscript/layer_methods/layerprintcolor.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layerprintwidth.htm -o sources/snapshots/rhinoscript/layer_methods/layerprintwidth.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/layervisible.htm -o sources/snapshots/rhinoscript/layer_methods/layervisible.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/matchlayer.htm -o sources/snapshots/rhinoscript/layer_methods/matchlayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/mergelayer.htm -o sources/snapshots/rhinoscript/layer_methods/mergelayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/parentlayer.htm -o sources/snapshots/rhinoscript/layer_methods/parentlayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/purgelayer.htm -o sources/snapshots/rhinoscript/layer_methods/purgelayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/renamelayer.htm -o sources/snapshots/rhinoscript/layer_methods/renamelayer.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/selectedlayers.htm -o sources/snapshots/rhinoscript/layer_methods/selectedlayers.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/selectlayers.htm -o sources/snapshots/rhinoscript/layer_methods/selectlayers.htm
mkdir -p sources/snapshots/rhinoscript/layer_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_methods/setlayerusertext.htm -o sources/snapshots/rhinoscript/layer_methods/setlayerusertext.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/deletelayerstate.htm -o sources/snapshots/rhinoscript/layer_state_methods/deletelayerstate.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/exportlayerstates.htm -o sources/snapshots/rhinoscript/layer_state_methods/exportlayerstates.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/importlayerstates.htm -o sources/snapshots/rhinoscript/layer_state_methods/importlayerstates.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/islayerstate.htm -o sources/snapshots/rhinoscript/layer_state_methods/islayerstate.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/layer_state_methods.htm -o sources/snapshots/rhinoscript/layer_state_methods/layer_state_methods.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/layerstatecount.htm -o sources/snapshots/rhinoscript/layer_state_methods/layerstatecount.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/layerstatenames.htm -o sources/snapshots/rhinoscript/layer_state_methods/layerstatenames.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/renamelayerstate.htm -o sources/snapshots/rhinoscript/layer_state_methods/renamelayerstate.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/restorelayerstate.htm -o sources/snapshots/rhinoscript/layer_state_methods/restorelayerstate.htm
mkdir -p sources/snapshots/rhinoscript/layer_state_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/layer_state_methods/savelayerstate.htm -o sources/snapshots/rhinoscript/layer_state_methods/savelayerstate.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/adddirectionallight.htm -o sources/snapshots/rhinoscript/light_methods/adddirectionallight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/addlinearlight.htm -o sources/snapshots/rhinoscript/light_methods/addlinearlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/addpointlight.htm -o sources/snapshots/rhinoscript/light_methods/addpointlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/addrectangularlight.htm -o sources/snapshots/rhinoscript/light_methods/addrectangularlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/addspotlight.htm -o sources/snapshots/rhinoscript/light_methods/addspotlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/enablelight.htm -o sources/snapshots/rhinoscript/light_methods/enablelight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/isdirectionallight.htm -o sources/snapshots/rhinoscript/light_methods/isdirectionallight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/islight.htm -o sources/snapshots/rhinoscript/light_methods/islight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/islightenabled.htm -o sources/snapshots/rhinoscript/light_methods/islightenabled.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/islightreference.htm -o sources/snapshots/rhinoscript/light_methods/islightreference.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/islinearlight.htm -o sources/snapshots/rhinoscript/light_methods/islinearlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/ispointlight.htm -o sources/snapshots/rhinoscript/light_methods/ispointlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/isrectangularlight.htm -o sources/snapshots/rhinoscript/light_methods/isrectangularlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/isspotlight.htm -o sources/snapshots/rhinoscript/light_methods/isspotlight.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/light_methods.htm -o sources/snapshots/rhinoscript/light_methods/light_methods.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightcolor.htm -o sources/snapshots/rhinoscript/light_methods/lightcolor.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightcount.htm -o sources/snapshots/rhinoscript/light_methods/lightcount.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightdirection.htm -o sources/snapshots/rhinoscript/light_methods/lightdirection.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightlocation.htm -o sources/snapshots/rhinoscript/light_methods/lightlocation.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightname.htm -o sources/snapshots/rhinoscript/light_methods/lightname.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/lightobjects.htm -o sources/snapshots/rhinoscript/light_methods/lightobjects.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/rectangularlightplane.htm -o sources/snapshots/rhinoscript/light_methods/rectangularlightplane.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/spotlighthardness.htm -o sources/snapshots/rhinoscript/light_methods/spotlighthardness.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/spotlightradius.htm -o sources/snapshots/rhinoscript/light_methods/spotlightradius.htm
mkdir -p sources/snapshots/rhinoscript/light_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/light_methods/spotlightshadowintensity.htm -o sources/snapshots/rhinoscript/light_methods/spotlightshadowintensity.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/circlecircleintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/circlecircleintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/distancetoplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/distancetoplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/evaluateplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/evaluateplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/intersectplanes.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/intersectplanes.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linearcintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linearcintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linebetweencurves.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linebetweencurves.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/lineboxintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/lineboxintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linecircleintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linecircleintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/lineclosestpoint.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/lineclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linecurveintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linecurveintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linecylinderintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linecylinderintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/lineisfartherthan.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/lineisfartherthan.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linelineintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linelineintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linemaxdistanceto.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linemaxdistanceto.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linemeshintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linemeshintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linemindistanceto.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linemindistanceto.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/lineplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/lineplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/lineplaneintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/lineplaneintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linesphereintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linesphereintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/linetransform.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/linetransform.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/moveplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/moveplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/plane_methods.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/plane_methods.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planeangle.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planeangle.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planearcintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planearcintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planecircleintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planecircleintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planeclosestpoint.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planeclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planecurveintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planecurveintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planeequation.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planeequation.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planefitfrompoints.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planefitfrompoints.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planefromframe.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planefromframe.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planefromnormal.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planefromnormal.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planefrompoints.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planefrompoints.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planeplaneintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planeplaneintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planesphereintersection.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planesphereintersection.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/planetransform.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/planetransform.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/rotateplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/rotateplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/worldxyplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/worldxyplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/worldyzplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/worldyzplane.htm
mkdir -p sources/snapshots/rhinoscript/line_and_plane_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/line_and_plane_methods/worldzxplane.htm -o sources/snapshots/rhinoscript/line_and_plane_methods/worldzxplane.htm
mkdir -p sources/snapshots/rhinoscript/linetype_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/linetype_methods/islinetype.htm -o sources/snapshots/rhinoscript/linetype_methods/islinetype.htm
mkdir -p sources/snapshots/rhinoscript/linetype_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/linetype_methods/islinetypereference.htm -o sources/snapshots/rhinoscript/linetype_methods/islinetypereference.htm
mkdir -p sources/snapshots/rhinoscript/linetype_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/linetype_methods/linetype_methods.htm -o sources/snapshots/rhinoscript/linetype_methods/linetype_methods.htm
mkdir -p sources/snapshots/rhinoscript/linetype_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/linetype_methods/linetypecount.htm -o sources/snapshots/rhinoscript/linetype_methods/linetypecount.htm
mkdir -p sources/snapshots/rhinoscript/linetype_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/linetype_methods/linetypenames.htm -o sources/snapshots/rhinoscript/linetype_methods/linetypenames.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/addmaterialtolayer.htm -o sources/snapshots/rhinoscript/material_methods/addmaterialtolayer.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/addmaterialtoobject.htm -o sources/snapshots/rhinoscript/material_methods/addmaterialtoobject.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/copymaterial.htm -o sources/snapshots/rhinoscript/material_methods/copymaterial.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/ismaterial.htm -o sources/snapshots/rhinoscript/material_methods/ismaterial.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/ismaterialdefault.htm -o sources/snapshots/rhinoscript/material_methods/ismaterialdefault.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/ismaterialreference.htm -o sources/snapshots/rhinoscript/material_methods/ismaterialreference.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/matchmaterial.htm -o sources/snapshots/rhinoscript/material_methods/matchmaterial.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/material_methods.htm -o sources/snapshots/rhinoscript/material_methods/material_methods.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialbump.htm -o sources/snapshots/rhinoscript/material_methods/materialbump.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialcolor.htm -o sources/snapshots/rhinoscript/material_methods/materialcolor.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialcount.htm -o sources/snapshots/rhinoscript/material_methods/materialcount.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialenvironmentmap.htm -o sources/snapshots/rhinoscript/material_methods/materialenvironmentmap.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialid.htm -o sources/snapshots/rhinoscript/material_methods/materialid.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialids.htm -o sources/snapshots/rhinoscript/material_methods/materialids.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialindex.htm -o sources/snapshots/rhinoscript/material_methods/materialindex.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialindices.htm -o sources/snapshots/rhinoscript/material_methods/materialindices.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialname.htm -o sources/snapshots/rhinoscript/material_methods/materialname.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialreflectivecolor.htm -o sources/snapshots/rhinoscript/material_methods/materialreflectivecolor.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialsbycolor.htm -o sources/snapshots/rhinoscript/material_methods/materialsbycolor.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialsbyname.htm -o sources/snapshots/rhinoscript/material_methods/materialsbyname.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialshine.htm -o sources/snapshots/rhinoscript/material_methods/materialshine.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialtexture.htm -o sources/snapshots/rhinoscript/material_methods/materialtexture.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialtransparency.htm -o sources/snapshots/rhinoscript/material_methods/materialtransparency.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/materialtransparencymap.htm -o sources/snapshots/rhinoscript/material_methods/materialtransparencymap.htm
mkdir -p sources/snapshots/rhinoscript/material_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/material_methods/resetmaterial.htm -o sources/snapshots/rhinoscript/material_methods/resetmaterial.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/acos.htm -o sources/snapshots/rhinoscript/math_methods/acos.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/acosh.htm -o sources/snapshots/rhinoscript/math_methods/acosh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/angle.htm -o sources/snapshots/rhinoscript/math_methods/angle.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/angle2.htm -o sources/snapshots/rhinoscript/math_methods/angle2.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/asin.htm -o sources/snapshots/rhinoscript/math_methods/asin.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/asinh.htm -o sources/snapshots/rhinoscript/math_methods/asinh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/atan2.htm -o sources/snapshots/rhinoscript/math_methods/atan2.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/atanh.htm -o sources/snapshots/rhinoscript/math_methods/atanh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/ceil.htm -o sources/snapshots/rhinoscript/math_methods/ceil.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/cosh.htm -o sources/snapshots/rhinoscript/math_methods/cosh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/deviation.htm -o sources/snapshots/rhinoscript/math_methods/deviation.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/distance.htm -o sources/snapshots/rhinoscript/math_methods/distance.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/e.htm -o sources/snapshots/rhinoscript/math_methods/e.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/floor.htm -o sources/snapshots/rhinoscript/math_methods/floor.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/fmod.htm -o sources/snapshots/rhinoscript/math_methods/fmod.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/hypot.htm -o sources/snapshots/rhinoscript/math_methods/hypot.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/log10.htm -o sources/snapshots/rhinoscript/math_methods/log10.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/math_methods.htm -o sources/snapshots/rhinoscript/math_methods/math_methods.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/max.htm -o sources/snapshots/rhinoscript/math_methods/max.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/mean.htm -o sources/snapshots/rhinoscript/math_methods/mean.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/median.htm -o sources/snapshots/rhinoscript/math_methods/median.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/min.htm -o sources/snapshots/rhinoscript/math_methods/min.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/pi.htm -o sources/snapshots/rhinoscript/math_methods/pi.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/polar.htm -o sources/snapshots/rhinoscript/math_methods/polar.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/rnd.htm -o sources/snapshots/rhinoscript/math_methods/rnd.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/sinh.htm -o sources/snapshots/rhinoscript/math_methods/sinh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/solvequadratic.htm -o sources/snapshots/rhinoscript/math_methods/solvequadratic.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/sum.htm -o sources/snapshots/rhinoscript/math_methods/sum.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/tanh.htm -o sources/snapshots/rhinoscript/math_methods/tanh.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/todegrees.htm -o sources/snapshots/rhinoscript/math_methods/todegrees.htm
mkdir -p sources/snapshots/rhinoscript/math_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/math_methods/toradians.htm -o sources/snapshots/rhinoscript/math_methods/toradians.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/addmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/addmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/addplanarmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/addplanarmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/connectedmeshfaces.htm -o sources/snapshots/rhinoscript/mesh_methods/connectedmeshfaces.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/curvemeshintersect.htm -o sources/snapshots/rhinoscript/mesh_methods/curvemeshintersect.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/deletemeshface.htm -o sources/snapshots/rhinoscript/mesh_methods/deletemeshface.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/disjointmeshcount.htm -o sources/snapshots/rhinoscript/mesh_methods/disjointmeshcount.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/duplicatemeshborder.htm -o sources/snapshots/rhinoscript/mesh_methods/duplicatemeshborder.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/explodemeshes.htm -o sources/snapshots/rhinoscript/mesh_methods/explodemeshes.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/extractanalysismesh.htm -o sources/snapshots/rhinoscript/mesh_methods/extractanalysismesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/extractrendermesh.htm -o sources/snapshots/rhinoscript/mesh_methods/extractrendermesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/flipmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/flipmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/ismesh.htm -o sources/snapshots/rhinoscript/mesh_methods/ismesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/ismeshclosed.htm -o sources/snapshots/rhinoscript/mesh_methods/ismeshclosed.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/ismeshdoubleprecision.htm -o sources/snapshots/rhinoscript/mesh_methods/ismeshdoubleprecision.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/ismeshmanifold.htm -o sources/snapshots/rhinoscript/mesh_methods/ismeshmanifold.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/ispointonmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/ispointonmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/joinmeshes.htm -o sources/snapshots/rhinoscript/mesh_methods/joinmeshes.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/mesh_methods.htm -o sources/snapshots/rhinoscript/mesh_methods/mesh_methods.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/mesharea.htm -o sources/snapshots/rhinoscript/mesh_methods/mesharea.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshareacentroid.htm -o sources/snapshots/rhinoscript/mesh_methods/meshareacentroid.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshareamoments.htm -o sources/snapshots/rhinoscript/mesh_methods/meshareamoments.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshbooleandifference.htm -o sources/snapshots/rhinoscript/mesh_methods/meshbooleandifference.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshbooleanintersection.htm -o sources/snapshots/rhinoscript/mesh_methods/meshbooleanintersection.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshbooleansplit.htm -o sources/snapshots/rhinoscript/mesh_methods/meshbooleansplit.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshbooleanunion.htm -o sources/snapshots/rhinoscript/mesh_methods/meshbooleanunion.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshclosestpoint.htm -o sources/snapshots/rhinoscript/mesh_methods/meshclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshcontourpoints.htm -o sources/snapshots/rhinoscript/mesh_methods/meshcontourpoints.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshfacecenters.htm -o sources/snapshots/rhinoscript/mesh_methods/meshfacecenters.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshfacecount.htm -o sources/snapshots/rhinoscript/mesh_methods/meshfacecount.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshfacenormals.htm -o sources/snapshots/rhinoscript/mesh_methods/meshfacenormals.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshfaces.htm -o sources/snapshots/rhinoscript/mesh_methods/meshfaces.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshfacevertices.htm -o sources/snapshots/rhinoscript/mesh_methods/meshfacevertices.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhasfacenormals.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhasfacenormals.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhashiddenvertices.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhashiddenvertices.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhastexturecoordinates.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhastexturecoordinates.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhasvertexcolors.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhasvertexcolors.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhasvertexnormals.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhasvertexnormals.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshhidevertices.htm -o sources/snapshots/rhinoscript/mesh_methods/meshhidevertices.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshmeshintersection.htm -o sources/snapshots/rhinoscript/mesh_methods/meshmeshintersection.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshnakededgepoints.htm -o sources/snapshots/rhinoscript/mesh_methods/meshnakededgepoints.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshobjects.htm -o sources/snapshots/rhinoscript/mesh_methods/meshobjects.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshoffset.htm -o sources/snapshots/rhinoscript/mesh_methods/meshoffset.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshoutline.htm -o sources/snapshots/rhinoscript/mesh_methods/meshoutline.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshparameterdensity.htm -o sources/snapshots/rhinoscript/mesh_methods/meshparameterdensity.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshparameters.htm -o sources/snapshots/rhinoscript/mesh_methods/meshparameters.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshpart.htm -o sources/snapshots/rhinoscript/mesh_methods/meshpart.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshpatch.htm -o sources/snapshots/rhinoscript/mesh_methods/meshpatch.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshquadcount.htm -o sources/snapshots/rhinoscript/mesh_methods/meshquadcount.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshquadstotriangles.htm -o sources/snapshots/rhinoscript/mesh_methods/meshquadstotriangles.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshtexturecoordinates.htm -o sources/snapshots/rhinoscript/mesh_methods/meshtexturecoordinates.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshtonurb.htm -o sources/snapshots/rhinoscript/mesh_methods/meshtonurb.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshtrianglecount.htm -o sources/snapshots/rhinoscript/mesh_methods/meshtrianglecount.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvertexcolors.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvertexcolors.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvertexcount.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvertexcount.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvertexfaces.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvertexfaces.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvertexnormals.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvertexnormals.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvertices.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvertices.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvolume.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvolume.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvolumecentroid.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvolumecentroid.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/meshvolumemoments.htm -o sources/snapshots/rhinoscript/mesh_methods/meshvolumemoments.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/pullcurvetomesh.htm -o sources/snapshots/rhinoscript/mesh_methods/pullcurvetomesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/reducemesh.htm -o sources/snapshots/rhinoscript/mesh_methods/reducemesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/smoothmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/smoothmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/splitdisjointmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/splitdisjointmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/unifymeshnormals.htm -o sources/snapshots/rhinoscript/mesh_methods/unifymeshnormals.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/unweldmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/unweldmesh.htm
mkdir -p sources/snapshots/rhinoscript/mesh_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/mesh_methods/weldmesh.htm -o sources/snapshots/rhinoscript/mesh_methods/weldmesh.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/appendnamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/appendnamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/deletenamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/deletenamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/named_position_methods.htm -o sources/snapshots/rhinoscript/named_position_methods/named_position_methods.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/namedpositioncount.htm -o sources/snapshots/rhinoscript/named_position_methods/namedpositioncount.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/namedpositions.htm -o sources/snapshots/rhinoscript/named_position_methods/namedpositions.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/renamenamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/renamenamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/restorenamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/restorenamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/savenamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/savenamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/selectobjectsofnamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/selectobjectsofnamedposition.htm
mkdir -p sources/snapshots/rhinoscript/named_position_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/named_position_methods/updatenamedposition.htm -o sources/snapshots/rhinoscript/named_position_methods/updatenamedposition.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/enableobjectgrips.htm -o sources/snapshots/rhinoscript/object_grip_methods/enableobjectgrips.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/getobjectgrip.htm -o sources/snapshots/rhinoscript/object_grip_methods/getobjectgrip.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/getobjectgrips.htm -o sources/snapshots/rhinoscript/object_grip_methods/getobjectgrips.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/nextobjectgrip.htm -o sources/snapshots/rhinoscript/object_grip_methods/nextobjectgrip.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/object_grip_methods.htm -o sources/snapshots/rhinoscript/object_grip_methods/object_grip_methods.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgripcount.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgripcount.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgriplocation.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgriplocation.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgriplocations.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgriplocations.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgripowner.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgripowner.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgripson.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgripson.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/objectgripsselected.htm -o sources/snapshots/rhinoscript/object_grip_methods/objectgripsselected.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/prevobjectgrip.htm -o sources/snapshots/rhinoscript/object_grip_methods/prevobjectgrip.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/selectedobjectgrips.htm -o sources/snapshots/rhinoscript/object_grip_methods/selectedobjectgrips.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/selectobjectgrip.htm -o sources/snapshots/rhinoscript/object_grip_methods/selectobjectgrip.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/selectobjectgrips.htm -o sources/snapshots/rhinoscript/object_grip_methods/selectobjectgrips.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/unselectobjectgrip.htm -o sources/snapshots/rhinoscript/object_grip_methods/unselectobjectgrip.htm
mkdir -p sources/snapshots/rhinoscript/object_grip_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_grip_methods/unselectobjectgrips.htm -o sources/snapshots/rhinoscript/object_grip_methods/unselectobjectgrips.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/addobjectdisplaymode.htm -o sources/snapshots/rhinoscript/object_methods/addobjectdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/addobjectmesh.htm -o sources/snapshots/rhinoscript/object_methods/addobjectmesh.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/bendobject.htm -o sources/snapshots/rhinoscript/object_methods/bendobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/boxmorphobject.htm -o sources/snapshots/rhinoscript/object_methods/boxmorphobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/changeobjectspace.htm -o sources/snapshots/rhinoscript/object_methods/changeobjectspace.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/copyobject.htm -o sources/snapshots/rhinoscript/object_methods/copyobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/copyobjects.htm -o sources/snapshots/rhinoscript/object_methods/copyobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/deleteobject.htm -o sources/snapshots/rhinoscript/object_methods/deleteobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/deleteobjects.htm -o sources/snapshots/rhinoscript/object_methods/deleteobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/enableobjectmesh.htm -o sources/snapshots/rhinoscript/object_methods/enableobjectmesh.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/flashobject.htm -o sources/snapshots/rhinoscript/object_methods/flashobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/flowobject.htm -o sources/snapshots/rhinoscript/object_methods/flowobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/hideobject.htm -o sources/snapshots/rhinoscript/object_methods/hideobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/hideobjects.htm -o sources/snapshots/rhinoscript/object_methods/hideobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/islayoutobject.htm -o sources/snapshots/rhinoscript/object_methods/islayoutobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobject.htm -o sources/snapshots/rhinoscript/object_methods/isobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectchild.htm -o sources/snapshots/rhinoscript/object_methods/isobjectchild.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjecthidden.htm -o sources/snapshots/rhinoscript/object_methods/isobjecthidden.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectinbox.htm -o sources/snapshots/rhinoscript/object_methods/isobjectinbox.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectingroup.htm -o sources/snapshots/rhinoscript/object_methods/isobjectingroup.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectlocked.htm -o sources/snapshots/rhinoscript/object_methods/isobjectlocked.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectnormal.htm -o sources/snapshots/rhinoscript/object_methods/isobjectnormal.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectparent.htm -o sources/snapshots/rhinoscript/object_methods/isobjectparent.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectreference.htm -o sources/snapshots/rhinoscript/object_methods/isobjectreference.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectselectable.htm -o sources/snapshots/rhinoscript/object_methods/isobjectselectable.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectselected.htm -o sources/snapshots/rhinoscript/object_methods/isobjectselected.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectsolid.htm -o sources/snapshots/rhinoscript/object_methods/isobjectsolid.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isobjectvalid.htm -o sources/snapshots/rhinoscript/object_methods/isobjectvalid.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/isvisibleinview.htm -o sources/snapshots/rhinoscript/object_methods/isvisibleinview.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/lockobject.htm -o sources/snapshots/rhinoscript/object_methods/lockobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/lockobjects.htm -o sources/snapshots/rhinoscript/object_methods/lockobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/maelstromobject.htm -o sources/snapshots/rhinoscript/object_methods/maelstromobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/matchobjectattributes.htm -o sources/snapshots/rhinoscript/object_methods/matchobjectattributes.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/mirrorobject.htm -o sources/snapshots/rhinoscript/object_methods/mirrorobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/mirrorobjects.htm -o sources/snapshots/rhinoscript/object_methods/mirrorobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/moveobject.htm -o sources/snapshots/rhinoscript/object_methods/moveobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/moveobjects.htm -o sources/snapshots/rhinoscript/object_methods/moveobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/object_methods.htm -o sources/snapshots/rhinoscript/object_methods/object_methods.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectcastsshadows.htm -o sources/snapshots/rhinoscript/object_methods/objectcastsshadows.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectchildren.htm -o sources/snapshots/rhinoscript/object_methods/objectchildren.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectclash.htm -o sources/snapshots/rhinoscript/object_methods/objectclash.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectcolor.htm -o sources/snapshots/rhinoscript/object_methods/objectcolor.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectcolorsource.htm -o sources/snapshots/rhinoscript/object_methods/objectcolorsource.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectdatacrc.htm -o sources/snapshots/rhinoscript/object_methods/objectdatacrc.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectdescription.htm -o sources/snapshots/rhinoscript/object_methods/objectdescription.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectdisplaymode.htm -o sources/snapshots/rhinoscript/object_methods/objectdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectdump.htm -o sources/snapshots/rhinoscript/object_methods/objectdump.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectgroups.htm -o sources/snapshots/rhinoscript/object_methods/objectgroups.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objecthashistory.htm -o sources/snapshots/rhinoscript/object_methods/objecthashistory.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objecthasmesh.htm -o sources/snapshots/rhinoscript/object_methods/objecthasmesh.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectlayer.htm -o sources/snapshots/rhinoscript/object_methods/objectlayer.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectlayout.htm -o sources/snapshots/rhinoscript/object_methods/objectlayout.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectlinetype.htm -o sources/snapshots/rhinoscript/object_methods/objectlinetype.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectlinetypesource.htm -o sources/snapshots/rhinoscript/object_methods/objectlinetypesource.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmaterialindex.htm -o sources/snapshots/rhinoscript/object_methods/objectmaterialindex.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmaterialsource.htm -o sources/snapshots/rhinoscript/object_methods/objectmaterialsource.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshdensity.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshdensity.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshmaxangle.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshmaxangle.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshmaxaspectratio.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshmaxaspectratio.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshmaxdistedgetosrf.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshmaxdistedgetosrf.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshmaxedgelength.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshmaxedgelength.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshminedgelength.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshminedgelength.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshmininitialgridquads.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshmininitialgridquads.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshquality.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshquality.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectmeshsettings.htm -o sources/snapshots/rhinoscript/object_methods/objectmeshsettings.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectname.htm -o sources/snapshots/rhinoscript/object_methods/objectname.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectnames.htm -o sources/snapshots/rhinoscript/object_methods/objectnames.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectparents.htm -o sources/snapshots/rhinoscript/object_methods/objectparents.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectprintcolor.htm -o sources/snapshots/rhinoscript/object_methods/objectprintcolor.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectprintcolorsource.htm -o sources/snapshots/rhinoscript/object_methods/objectprintcolorsource.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectprintwidth.htm -o sources/snapshots/rhinoscript/object_methods/objectprintwidth.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectprintwidthsource.htm -o sources/snapshots/rhinoscript/object_methods/objectprintwidthsource.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectreceivesshadows.htm -o sources/snapshots/rhinoscript/object_methods/objectreceivesshadows.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectserialnumber.htm -o sources/snapshots/rhinoscript/object_methods/objectserialnumber.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objectspace.htm -o sources/snapshots/rhinoscript/object_methods/objectspace.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objecttopgroup.htm -o sources/snapshots/rhinoscript/object_methods/objecttopgroup.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objecttype.htm -o sources/snapshots/rhinoscript/object_methods/objecttype.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/objecturl.htm -o sources/snapshots/rhinoscript/object_methods/objecturl.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/orientobject.htm -o sources/snapshots/rhinoscript/object_methods/orientobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/orientobjects.htm -o sources/snapshots/rhinoscript/object_methods/orientobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/remapobject.htm -o sources/snapshots/rhinoscript/object_methods/remapobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/remapobjects.htm -o sources/snapshots/rhinoscript/object_methods/remapobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/removeobjectdisplaymode.htm -o sources/snapshots/rhinoscript/object_methods/removeobjectdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/replacegeometry.htm -o sources/snapshots/rhinoscript/object_methods/replacegeometry.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/rotateobject.htm -o sources/snapshots/rhinoscript/object_methods/rotateobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/rotateobjects.htm -o sources/snapshots/rhinoscript/object_methods/rotateobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/scaleobject.htm -o sources/snapshots/rhinoscript/object_methods/scaleobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/scaleobjects.htm -o sources/snapshots/rhinoscript/object_methods/scaleobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/selectobject.htm -o sources/snapshots/rhinoscript/object_methods/selectobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/selectobjects.htm -o sources/snapshots/rhinoscript/object_methods/selectobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/shearobject.htm -o sources/snapshots/rhinoscript/object_methods/shearobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/shearobjects.htm -o sources/snapshots/rhinoscript/object_methods/shearobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/showobject.htm -o sources/snapshots/rhinoscript/object_methods/showobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/showobjects.htm -o sources/snapshots/rhinoscript/object_methods/showobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/splopobject.htm -o sources/snapshots/rhinoscript/object_methods/splopobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/sporphobject.htm -o sources/snapshots/rhinoscript/object_methods/sporphobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/stretchobject.htm -o sources/snapshots/rhinoscript/object_methods/stretchobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/taperobject.htm -o sources/snapshots/rhinoscript/object_methods/taperobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/transformobject.htm -o sources/snapshots/rhinoscript/object_methods/transformobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/transformobjects.htm -o sources/snapshots/rhinoscript/object_methods/transformobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/twistobject.htm -o sources/snapshots/rhinoscript/object_methods/twistobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/unlockobject.htm -o sources/snapshots/rhinoscript/object_methods/unlockobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/unlockobjects.htm -o sources/snapshots/rhinoscript/object_methods/unlockobjects.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/unselectobject.htm -o sources/snapshots/rhinoscript/object_methods/unselectobject.htm
mkdir -p sources/snapshots/rhinoscript/object_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/object_methods/unselectobjects.htm -o sources/snapshots/rhinoscript/object_methods/unselectobjects.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/isvectorparallelto.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/isvectorparallelto.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/isvectorperpendicularto.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/isvectorperpendicularto.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/isvectortiny.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/isvectortiny.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/isvectorzero.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/isvectorzero.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/point_and_vector_methods.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/point_and_vector_methods.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointadd.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointadd.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointarrayboundingbox.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointarrayboundingbox.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointarrayclosestpoint.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointarrayclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointarraytransform.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointarraytransform.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointclosestobject.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointclosestobject.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointcompare.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointcompare.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointdivide.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointdivide.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointsarecoplanar.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointsarecoplanar.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointscale.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointscale.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointsubtract.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointsubtract.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pointtransform.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pointtransform.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/projectpointtomesh.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/projectpointtomesh.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/projectpointtosurface.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/projectpointtosurface.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/pullpoints.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/pullpoints.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectoradd.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectoradd.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorangle.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorangle.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorcompare.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorcompare.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorcreate.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorcreate.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorcrossproduct.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorcrossproduct.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectordivide.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectordivide.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectordotproduct.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectordotproduct.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorlength.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorlength.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectormultiply.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectormultiply.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorreverse.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorreverse.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorrotate.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorrotate.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorscale.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorscale.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorsubtract.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorsubtract.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectortransform.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectortransform.htm
mkdir -p sources/snapshots/rhinoscript/point_and_vector_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/point_and_vector_methods/vectorunitize.htm -o sources/snapshots/rhinoscript/point_and_vector_methods/vectorunitize.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/bringtotop.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/bringtotop.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/getpluginobject.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/getpluginobject.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/getscriptobject.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/getscriptobject.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/isinitialized.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/isinitialized.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/releasewithoutclosing.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/releasewithoutclosing.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/rhino_properties_and_methods.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/rhino_properties_and_methods.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/runscript.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/runscript.htm
mkdir -p sources/snapshots/rhinoscript/rhino_properties_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhino_properties_methods/visible.htm -o sources/snapshots/rhinoscript/rhino_properties_methods/visible.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/arrays_of_points.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/arrays_of_points.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/lines.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/lines.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/objects.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/objects.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/planes.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/planes.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/points.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/points.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/rhinoscript_fundamentals.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/rhinoscript_fundamentals.htm
mkdir -p sources/snapshots/rhinoscript/rhinoscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_fundamentals/vectors.htm -o sources/snapshots/rhinoscript/rhinoscript_fundamentals/vectors.htm
mkdir -p sources/snapshots/rhinoscript
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/rhinoscript_methods.htm -o sources/snapshots/rhinoscript/rhinoscript_methods.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/annotatecurveendpoints.htm -o sources/snapshots/rhinoscript/sample_scripts/annotatecurveendpoints.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/arraypointsonsurface.htm -o sources/snapshots/rhinoscript/sample_scripts/arraypointsonsurface.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/circlefromcircumference.htm -o sources/snapshots/rhinoscript/sample_scripts/circlefromcircumference.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/copyobjectstolayer.htm -o sources/snapshots/rhinoscript/sample_scripts/copyobjectstolayer.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/createshortcut.htm -o sources/snapshots/rhinoscript/sample_scripts/createshortcut.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/currentmodelinfo.htm -o sources/snapshots/rhinoscript/sample_scripts/currentmodelinfo.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/curvelength.htm -o sources/snapshots/rhinoscript/sample_scripts/curvelength.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/drawparametriccurve.htm -o sources/snapshots/rhinoscript/sample_scripts/drawparametriccurve.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/dumpdocumentdata.htm -o sources/snapshots/rhinoscript/sample_scripts/dumpdocumentdata.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/dynamicarray.htm -o sources/snapshots/rhinoscript/sample_scripts/dynamicarray.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/exportpoints.htm -o sources/snapshots/rhinoscript/sample_scripts/exportpoints.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/formatmessage.htm -o sources/snapshots/rhinoscript/sample_scripts/formatmessage.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/gardenpath.htm -o sources/snapshots/rhinoscript/sample_scripts/gardenpath.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/getarraydim.htm -o sources/snapshots/rhinoscript/sample_scripts/getarraydim.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/importcurvefromexcel.htm -o sources/snapshots/rhinoscript/sample_scripts/importcurvefromexcel.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/makenurbscurve.htm -o sources/snapshots/rhinoscript/sample_scripts/makenurbscurve.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/readtextfile.htm -o sources/snapshots/rhinoscript/sample_scripts/readtextfile.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/rgb_helpers.htm -o sources/snapshots/rhinoscript/sample_scripts/rgb_helpers.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/rhino_rvb.htm -o sources/snapshots/rhinoscript/sample_scripts/rhino_rvb.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/ringtorus.htm -o sources/snapshots/rhinoscript/sample_scripts/ringtorus.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/sample_scripts.htm -o sources/snapshots/rhinoscript/sample_scripts/sample_scripts.htm
mkdir -p sources/snapshots/rhinoscript/sample_scripts
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/sample_scripts/saveview.htm -o sources/snapshots/rhinoscript/sample_scripts/saveview.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/allobjects.htm -o sources/snapshots/rhinoscript/selection_methods/allobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/filterobjects.htm -o sources/snapshots/rhinoscript/selection_methods/filterobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/firstobject.htm -o sources/snapshots/rhinoscript/selection_methods/firstobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getcurveobject.htm -o sources/snapshots/rhinoscript/selection_methods/getcurveobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getobject.htm -o sources/snapshots/rhinoscript/selection_methods/getobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getobjectex.htm -o sources/snapshots/rhinoscript/selection_methods/getobjectex.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getobjects.htm -o sources/snapshots/rhinoscript/selection_methods/getobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getobjectsex.htm -o sources/snapshots/rhinoscript/selection_methods/getobjectsex.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getpointcoordinates.htm -o sources/snapshots/rhinoscript/selection_methods/getpointcoordinates.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/getsurfaceobject.htm -o sources/snapshots/rhinoscript/selection_methods/getsurfaceobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/hiddenobjects.htm -o sources/snapshots/rhinoscript/selection_methods/hiddenobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/invertselectedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/invertselectedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/lastcreatedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/lastcreatedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/lastobject.htm -o sources/snapshots/rhinoscript/selection_methods/lastobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/lockedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/lockedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/nextobject.htm -o sources/snapshots/rhinoscript/selection_methods/nextobject.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/normalobjects.htm -o sources/snapshots/rhinoscript/selection_methods/normalobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbycolor.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbycolor.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbygroup.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbygroup.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbylayer.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbylayer.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbymaterialindex.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbymaterialindex.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbymaterialsource.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbymaterialsource.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbyname.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbyname.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbyregion.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbyregion.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbytype.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbytype.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/objectsbyurl.htm -o sources/snapshots/rhinoscript/selection_methods/objectsbyurl.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/pointpick.htm -o sources/snapshots/rhinoscript/selection_methods/pointpick.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/prevselectedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/prevselectedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/referenceobjects.htm -o sources/snapshots/rhinoscript/selection_methods/referenceobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/selectedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/selectedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/selection_methods.htm -o sources/snapshots/rhinoscript/selection_methods/selection_methods.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/unselectallobjects.htm -o sources/snapshots/rhinoscript/selection_methods/unselectallobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/unselectedobjects.htm -o sources/snapshots/rhinoscript/selection_methods/unselectedobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/visibleobjects.htm -o sources/snapshots/rhinoscript/selection_methods/visibleobjects.htm
mkdir -p sources/snapshots/rhinoscript/selection_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/selection_methods/windowpick.htm -o sources/snapshots/rhinoscript/selection_methods/windowpick.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addbox.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addbox.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addcone.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addcone.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addcutplane.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addcutplane.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addcylinder.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addcylinder.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addedgesrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addedgesrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addextrusion.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addextrusion.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addloftsrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addloftsrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addnetworksrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addnetworksrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addnetworksrfex.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addnetworksrfex.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addnurbssurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addnurbssurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addpatch.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addpatch.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addpipe.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addpipe.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addplanarsrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addplanarsrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addplanesurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addplanesurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addrailrevsrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addrailrevsrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addrevsrf.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addrevsrf.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsphere.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsphere.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsrfcontourcrvs.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsrfcontourcrvs.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsrfcontrolptgrid.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsrfcontrolptgrid.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsrfpt.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsrfpt.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsrfptgrid.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsrfptgrid.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsrfsectioncrvs.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsrfsectioncrvs.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsweep1.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsweep1.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addsweep2.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addsweep2.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addthickpipe.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addthickpipe.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addtorus.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addtorus.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/addtruncatedcone.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/addtruncatedcone.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/booleandifference.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/booleandifference.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/booleanintersection.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/booleanintersection.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/booleanunion.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/booleanunion.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/boxpoints.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/boxpoints.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/brepclosestpoint.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/brepclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/capplanarholes.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/capplanarholes.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/changesurfacedegree.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/changesurfacedegree.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/convertextrusion.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/convertextrusion.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/convertsurfacetobezier.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/convertsurfacetobezier.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/createsolid.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/createsolid.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/duplicateedgecurves.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/duplicateedgecurves.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/duplicatesurfaceborder.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/duplicatesurfaceborder.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/evaluatesurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/evaluatesurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/explodepolysurfaces.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/explodepolysurfaces.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extendsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extendsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extractisocurve.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extractisocurve.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extractsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extractsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudecurve.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudecurve.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudecurvenormal.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudecurvenormal.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudecurvepoint.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudecurvepoint.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudecurvestraight.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudecurvestraight.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudecurvetapered.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudecurvetapered.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/extrudesurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/extrudesurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/filletsurfaces.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/filletsurfaces.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/filletsurfacesex.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/filletsurfacesex.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/fitsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/fitsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/flipsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/flipsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/insertsurfaceknot.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/insertsurfaceknot.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/intersectbreps.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/intersectbreps.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/intersectspheres.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/intersectspheres.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isbox.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isbox.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isbrep.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isbrep.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isbrepmanifold.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isbrepmanifold.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/iscone.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/iscone.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/iscylinder.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/iscylinder.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isextrusion.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isextrusion.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isnurbssurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isnurbssurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isparameteronsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isparameteronsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isplanesurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isplanesurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/ispointinsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/ispointinsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/ispointonsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/ispointonsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/ispolysurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/ispolysurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/ispolysurfaceclosed.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/ispolysurfaceclosed.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/ispolysurfaceplanar.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/ispolysurfaceplanar.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/isrevsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/isrevsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issphere.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issphere.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issumsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issumsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfaceclosed.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfaceclosed.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfaceperiodic.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfaceperiodic.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfaceplanar.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfaceplanar.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfacerational.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfacerational.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfacesingular.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfacesingular.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfacetrimmed.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfacetrimmed.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/issurfaceunrollable.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/issurfaceunrollable.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/istorus.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/istorus.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/joinsurfaces.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/joinsurfaces.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/joinsurfacesex.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/joinsurfacesex.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/makesurfacenonperiodic.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/makesurfacenonperiodic.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/makesurfaceperiodic.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/makesurfaceperiodic.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/mergesurfaces.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/mergesurfaces.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/offsetbrep.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/offsetbrep.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/offsetsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/offsetsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/pullcurve.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/pullcurve.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/rebuildsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/rebuildsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/removesurfaceknot.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/removesurfaceknot.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/reversesurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/reversesurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/shootray.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/shootray.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/shortpath.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/shortpath.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/shrinktrimmedsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/shrinktrimmedsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/smoothsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/smoothsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/softeditsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/softeditsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/splitbrep.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/splitbrep.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/splitsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/splitsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/splitsurfaceex.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/splitsurfaceex.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surface_methods.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surface_methods.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacearea.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacearea.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceareacentroid.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceareacentroid.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceareamoments.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceareamoments.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceclosestpoint.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceclosestpoint.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecone.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecone.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecontourpoints.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecontourpoints.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecount.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecount.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecurvature.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecurvature.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecurvatureanalysis.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecurvatureanalysis.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacecylinder.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacecylinder.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacedegree.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacedegree.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacedividealongcreases.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacedividealongcreases.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacedomain.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacedomain.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacedraftanglepoint.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacedraftanglepoint.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceeditpoints.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceeditpoints.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceevaluate.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceevaluate.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceframe.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceframe.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceisocurvedensity.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceisocurvedensity.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceknotcount.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceknotcount.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceknots.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceknots.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacenormal.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacenormal.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacenormalizedparameter.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacenormalizedparameter.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceparameter.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceparameter.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacepointcount.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacepointcount.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacepoints.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacepoints.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceprincipalcurvature.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceprincipalcurvature.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceseam.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceseam.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacesphere.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacesphere.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacesurfaceintersection.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacesurfaceintersection.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacetorus.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacetorus.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacevolume.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacevolume.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacevolumecentroid.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacevolumecentroid.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfacevolumemoments.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfacevolumemoments.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/surfaceweights.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/surfaceweights.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/trimbrep.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/trimbrep.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/trimsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/trimsurface.htm
mkdir -p sources/snapshots/rhinoscript/surface_and_polysurface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/surface_and_polysurface_methods/unrollsurface.htm -o sources/snapshots/rhinoscript/surface_and_polysurface_methods/unrollsurface.htm
mkdir -p sources/snapshots/rhinoscript
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/title.htm -o sources/snapshots/rhinoscript/title.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/addtoolbar.htm -o sources/snapshots/rhinoscript/toolbar_methods/addtoolbar.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/addtoolbarbutton.htm -o sources/snapshots/rhinoscript/toolbar_methods/addtoolbarbutton.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/addtoolbarcollection.htm -o sources/snapshots/rhinoscript/toolbar_methods/addtoolbarcollection.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/closetoolbarcollection.htm -o sources/snapshots/rhinoscript/toolbar_methods/closetoolbarcollection.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/deletetoolbar.htm -o sources/snapshots/rhinoscript/toolbar_methods/deletetoolbar.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/hidetoolbar.htm -o sources/snapshots/rhinoscript/toolbar_methods/hidetoolbar.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/istoolbar.htm -o sources/snapshots/rhinoscript/toolbar_methods/istoolbar.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/istoolbarcollection.htm -o sources/snapshots/rhinoscript/toolbar_methods/istoolbarcollection.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/istoolbardocked.htm -o sources/snapshots/rhinoscript/toolbar_methods/istoolbardocked.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/istoolbarvisible.htm -o sources/snapshots/rhinoscript/toolbar_methods/istoolbarvisible.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/opentoolbarcollection.htm -o sources/snapshots/rhinoscript/toolbar_methods/opentoolbarcollection.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/savetoolbarcollection.htm -o sources/snapshots/rhinoscript/toolbar_methods/savetoolbarcollection.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/savetoolbarcollectionas.htm -o sources/snapshots/rhinoscript/toolbar_methods/savetoolbarcollectionas.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/showtoolbar.htm -o sources/snapshots/rhinoscript/toolbar_methods/showtoolbar.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbar_methods.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbar_methods.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbarcollectioncount.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbarcollectioncount.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbarcollectionnames.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbarcollectionnames.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbarcollectionpath.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbarcollectionpath.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbarcount.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbarcount.htm
mkdir -p sources/snapshots/rhinoscript/toolbar_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/toolbar_methods/toolbarnames.htm -o sources/snapshots/rhinoscript/toolbar_methods/toolbarnames.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/isxformidentity.htm -o sources/snapshots/rhinoscript/transformation_methods/isxformidentity.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/isxformsimilarity.htm -o sources/snapshots/rhinoscript/transformation_methods/isxformsimilarity.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/isxformsingular.htm -o sources/snapshots/rhinoscript/transformation_methods/isxformsingular.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/isxformzero.htm -o sources/snapshots/rhinoscript/transformation_methods/isxformzero.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/transformation_methods.htm -o sources/snapshots/rhinoscript/transformation_methods/transformation_methods.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformchangebasis.htm -o sources/snapshots/rhinoscript/transformation_methods/xformchangebasis.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformcompare.htm -o sources/snapshots/rhinoscript/transformation_methods/xformcompare.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformcplanetoworld.htm -o sources/snapshots/rhinoscript/transformation_methods/xformcplanetoworld.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformdeterminant.htm -o sources/snapshots/rhinoscript/transformation_methods/xformdeterminant.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformdiagonal.htm -o sources/snapshots/rhinoscript/transformation_methods/xformdiagonal.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformidentity.htm -o sources/snapshots/rhinoscript/transformation_methods/xformidentity.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xforminverse.htm -o sources/snapshots/rhinoscript/transformation_methods/xforminverse.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformlayouttoworld.htm -o sources/snapshots/rhinoscript/transformation_methods/xformlayouttoworld.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformmirror.htm -o sources/snapshots/rhinoscript/transformation_methods/xformmirror.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformmultiply.htm -o sources/snapshots/rhinoscript/transformation_methods/xformmultiply.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformplanarprojection.htm -o sources/snapshots/rhinoscript/transformation_methods/xformplanarprojection.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformrotation.htm -o sources/snapshots/rhinoscript/transformation_methods/xformrotation.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformscale.htm -o sources/snapshots/rhinoscript/transformation_methods/xformscale.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformscreentoworld.htm -o sources/snapshots/rhinoscript/transformation_methods/xformscreentoworld.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformshear.htm -o sources/snapshots/rhinoscript/transformation_methods/xformshear.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformtranslation.htm -o sources/snapshots/rhinoscript/transformation_methods/xformtranslation.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformworldtocplane.htm -o sources/snapshots/rhinoscript/transformation_methods/xformworldtocplane.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformworldtolayout.htm -o sources/snapshots/rhinoscript/transformation_methods/xformworldtolayout.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformworldtoscreen.htm -o sources/snapshots/rhinoscript/transformation_methods/xformworldtoscreen.htm
mkdir -p sources/snapshots/rhinoscript/transformation_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/transformation_methods/xformzero.htm -o sources/snapshots/rhinoscript/transformation_methods/xformzero.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/attributedatacount.htm -o sources/snapshots/rhinoscript/user_data_methods/attributedatacount.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/deleteattributedata.htm -o sources/snapshots/rhinoscript/user_data_methods/deleteattributedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/deletedocumentdata.htm -o sources/snapshots/rhinoscript/user_data_methods/deletedocumentdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/deleteobjectdata.htm -o sources/snapshots/rhinoscript/user_data_methods/deleteobjectdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/documentdatacount.htm -o sources/snapshots/rhinoscript/user_data_methods/documentdatacount.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getattributedata.htm -o sources/snapshots/rhinoscript/user_data_methods/getattributedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getdocumentdata.htm -o sources/snapshots/rhinoscript/user_data_methods/getdocumentdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getdocumentusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/getdocumentusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getobjectdata.htm -o sources/snapshots/rhinoscript/user_data_methods/getobjectdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getruntimedata.htm -o sources/snapshots/rhinoscript/user_data_methods/getruntimedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/getusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/getusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/isattributedata.htm -o sources/snapshots/rhinoscript/user_data_methods/isattributedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/isdocumentdata.htm -o sources/snapshots/rhinoscript/user_data_methods/isdocumentdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/isdocumentusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/isdocumentusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/isobjectdata.htm -o sources/snapshots/rhinoscript/user_data_methods/isobjectdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/isusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/isusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/objectdatacount.htm -o sources/snapshots/rhinoscript/user_data_methods/objectdatacount.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/runtimedatacount.htm -o sources/snapshots/rhinoscript/user_data_methods/runtimedatacount.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setattributedata.htm -o sources/snapshots/rhinoscript/user_data_methods/setattributedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setdocumentdata.htm -o sources/snapshots/rhinoscript/user_data_methods/setdocumentdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setdocumentusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/setdocumentusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setobjectdata.htm -o sources/snapshots/rhinoscript/user_data_methods/setobjectdata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setruntimedata.htm -o sources/snapshots/rhinoscript/user_data_methods/setruntimedata.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/setusertext.htm -o sources/snapshots/rhinoscript/user_data_methods/setusertext.htm
mkdir -p sources/snapshots/rhinoscript/user_data_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_data_methods/user_data_methods.htm -o sources/snapshots/rhinoscript/user_data_methods/user_data_methods.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/browseforfolder.htm -o sources/snapshots/rhinoscript/user_interface_methods/browseforfolder.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/checklistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/checklistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/combolistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/combolistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/editbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/editbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/editlistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/editlistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getangle.htm -o sources/snapshots/rhinoscript/user_interface_methods/getangle.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getangleex.htm -o sources/snapshots/rhinoscript/user_interface_methods/getangleex.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getboolean.htm -o sources/snapshots/rhinoscript/user_interface_methods/getboolean.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/getbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getcircle.htm -o sources/snapshots/rhinoscript/user_interface_methods/getcircle.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getcolor.htm -o sources/snapshots/rhinoscript/user_interface_methods/getcolor.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getcursorpos.htm -o sources/snapshots/rhinoscript/user_interface_methods/getcursorpos.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getdistance.htm -o sources/snapshots/rhinoscript/user_interface_methods/getdistance.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getedgecurves.htm -o sources/snapshots/rhinoscript/user_interface_methods/getedgecurves.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getinteger.htm -o sources/snapshots/rhinoscript/user_interface_methods/getinteger.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getkey.htm -o sources/snapshots/rhinoscript/user_interface_methods/getkey.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getlayer.htm -o sources/snapshots/rhinoscript/user_interface_methods/getlayer.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getlayers.htm -o sources/snapshots/rhinoscript/user_interface_methods/getlayers.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getline.htm -o sources/snapshots/rhinoscript/user_interface_methods/getline.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getlinetype.htm -o sources/snapshots/rhinoscript/user_interface_methods/getlinetype.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getmeshfaces.htm -o sources/snapshots/rhinoscript/user_interface_methods/getmeshfaces.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getmeshvertices.htm -o sources/snapshots/rhinoscript/user_interface_methods/getmeshvertices.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getoption.htm -o sources/snapshots/rhinoscript/user_interface_methods/getoption.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpoint.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpoint.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpointoncurve.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpointoncurve.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpointonline.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpointonline.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpointonmesh.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpointonmesh.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpointonplane.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpointonplane.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpointonsurface.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpointonsurface.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpoints.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpoints.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getpolyline.htm -o sources/snapshots/rhinoscript/user_interface_methods/getpolyline.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getprintwidth.htm -o sources/snapshots/rhinoscript/user_interface_methods/getprintwidth.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getreal.htm -o sources/snapshots/rhinoscript/user_interface_methods/getreal.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getrectangle.htm -o sources/snapshots/rhinoscript/user_interface_methods/getrectangle.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getstring.htm -o sources/snapshots/rhinoscript/user_interface_methods/getstring.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/getsurfaceisoparampoint.htm -o sources/snapshots/rhinoscript/user_interface_methods/getsurfaceisoparampoint.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/htmlbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/htmlbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/integerbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/integerbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/listbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/listbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/messagebeep.htm -o sources/snapshots/rhinoscript/user_interface_methods/messagebeep.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/messagebox.htm -o sources/snapshots/rhinoscript/user_interface_methods/messagebox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/multilistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/multilistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/openfilename.htm -o sources/snapshots/rhinoscript/user_interface_methods/openfilename.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/openfilenames.htm -o sources/snapshots/rhinoscript/user_interface_methods/openfilenames.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/orderlistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/orderlistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/popupmenu.htm -o sources/snapshots/rhinoscript/user_interface_methods/popupmenu.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/propertylistbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/propertylistbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/realbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/realbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/savefilename.htm -o sources/snapshots/rhinoscript/user_interface_methods/savefilename.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/setcursorpos.htm -o sources/snapshots/rhinoscript/user_interface_methods/setcursorpos.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/stringbox.htm -o sources/snapshots/rhinoscript/user_interface_methods/stringbox.htm
mkdir -p sources/snapshots/rhinoscript/user_interface_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/user_interface_methods/user_interface_methods.htm -o sources/snapshots/rhinoscript/user_interface_methods/user_interface_methods.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/allprocedures.htm -o sources/snapshots/rhinoscript/utility_methods/allprocedures.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/clipboardtext.htm -o sources/snapshots/rhinoscript/utility_methods/clipboardtext.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/coloradjustluma.htm -o sources/snapshots/rhinoscript/utility_methods/coloradjustluma.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorbluevalue.htm -o sources/snapshots/rhinoscript/utility_methods/colorbluevalue.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorgreenvalue.htm -o sources/snapshots/rhinoscript/utility_methods/colorgreenvalue.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorhlstorgb.htm -o sources/snapshots/rhinoscript/utility_methods/colorhlstorgb.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorhsvtorgb.htm -o sources/snapshots/rhinoscript/utility_methods/colorhsvtorgb.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorredvalue.htm -o sources/snapshots/rhinoscript/utility_methods/colorredvalue.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorrgbtohls.htm -o sources/snapshots/rhinoscript/utility_methods/colorrgbtohls.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/colorrgbtohsv.htm -o sources/snapshots/rhinoscript/utility_methods/colorrgbtohsv.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/cullduplicatenumbers.htm -o sources/snapshots/rhinoscript/utility_methods/cullduplicatenumbers.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/cullduplicatepoints.htm -o sources/snapshots/rhinoscript/utility_methods/cullduplicatepoints.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/cullduplicatestrings.htm -o sources/snapshots/rhinoscript/utility_methods/cullduplicatestrings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/currentprinter.htm -o sources/snapshots/rhinoscript/utility_methods/currentprinter.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/findduplicatenumbers.htm -o sources/snapshots/rhinoscript/utility_methods/findduplicatenumbers.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/findduplicatepoints.htm -o sources/snapshots/rhinoscript/utility_methods/findduplicatepoints.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/findduplicatestrings.htm -o sources/snapshots/rhinoscript/utility_methods/findduplicatestrings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/getasynckeystate.htm -o sources/snapshots/rhinoscript/utility_methods/getasynckeystate.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/getsettings.htm -o sources/snapshots/rhinoscript/utility_methods/getsettings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/getsystemmetrics.htm -o sources/snapshots/rhinoscript/utility_methods/getsystemmetrics.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/imageinfo.htm -o sources/snapshots/rhinoscript/utility_methods/imageinfo.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/intersectstrings.htm -o sources/snapshots/rhinoscript/utility_methods/intersectstrings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/isprocedure.htm -o sources/snapshots/rhinoscript/utility_methods/isprocedure.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/joinarrays.htm -o sources/snapshots/rhinoscript/utility_methods/joinarrays.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/makearray.htm -o sources/snapshots/rhinoscript/utility_methods/makearray.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/oncancelscript.htm -o sources/snapshots/rhinoscript/utility_methods/oncancelscript.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/playsound.htm -o sources/snapshots/rhinoscript/utility_methods/playsound.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/printernames.htm -o sources/snapshots/rhinoscript/utility_methods/printernames.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/pt2str.htm -o sources/snapshots/rhinoscript/utility_methods/pt2str.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/readdelimitedfile.htm -o sources/snapshots/rhinoscript/utility_methods/readdelimitedfile.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/readtextfile.htm -o sources/snapshots/rhinoscript/utility_methods/readtextfile.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/savesettings.htm -o sources/snapshots/rhinoscript/utility_methods/savesettings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/simplifyarray.htm -o sources/snapshots/rhinoscript/utility_methods/simplifyarray.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sleep.htm -o sources/snapshots/rhinoscript/utility_methods/sleep.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sort.htm -o sources/snapshots/rhinoscript/utility_methods/sort.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sortnumbers.htm -o sources/snapshots/rhinoscript/utility_methods/sortnumbers.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sortpointlist.htm -o sources/snapshots/rhinoscript/utility_methods/sortpointlist.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sortpoints.htm -o sources/snapshots/rhinoscript/utility_methods/sortpoints.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/sortpointsbydistance.htm -o sources/snapshots/rhinoscript/utility_methods/sortpointsbydistance.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/spooltoprinter.htm -o sources/snapshots/rhinoscript/utility_methods/spooltoprinter.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/str2pt.htm -o sources/snapshots/rhinoscript/utility_methods/str2pt.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/str2ptarray.htm -o sources/snapshots/rhinoscript/utility_methods/str2ptarray.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/strtok.htm -o sources/snapshots/rhinoscript/utility_methods/strtok.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/textout.htm -o sources/snapshots/rhinoscript/utility_methods/textout.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/unionstrings.htm -o sources/snapshots/rhinoscript/utility_methods/unionstrings.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/utility_methods.htm -o sources/snapshots/rhinoscript/utility_methods/utility_methods.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/version.htm -o sources/snapshots/rhinoscript/utility_methods/version.htm
mkdir -p sources/snapshots/rhinoscript/utility_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/utility_methods/writetextfile.htm -o sources/snapshots/rhinoscript/utility_methods/writetextfile.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_coding_conventions.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_coding_conventions.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_conditional_statements.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_conditional_statements.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_constants.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_constants.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_data_types.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_data_types.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_fundamentals.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_fundamentals.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_looping.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_looping.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_operators.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_operators.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_procedures.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_procedures.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_statements.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_statements.htm
mkdir -p sources/snapshots/rhinoscript/vbscript_fundamentals
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/vbscript_fundamentals/vbscript_variables.htm -o sources/snapshots/rhinoscript/vbscript_fundamentals/vbscript_variables.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/addnamedcplane.htm -o sources/snapshots/rhinoscript/view_methods/addnamedcplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/addnamedview.htm -o sources/snapshots/rhinoscript/view_methods/addnamedview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/backgroundbitmap.htm -o sources/snapshots/rhinoscript/view_methods/backgroundbitmap.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/currentdetail.htm -o sources/snapshots/rhinoscript/view_methods/currentdetail.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/currentview.htm -o sources/snapshots/rhinoscript/view_methods/currentview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/deletenamedcplane.htm -o sources/snapshots/rhinoscript/view_methods/deletenamedcplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/deletenamedview.htm -o sources/snapshots/rhinoscript/view_methods/deletenamedview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/deleteviewdisplaymode.htm -o sources/snapshots/rhinoscript/view_methods/deleteviewdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/detailnames.htm -o sources/snapshots/rhinoscript/view_methods/detailnames.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/exportviewdisplaymode.htm -o sources/snapshots/rhinoscript/view_methods/exportviewdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/importviewdisplaymode.htm -o sources/snapshots/rhinoscript/view_methods/importviewdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isbackgroundbitmap.htm -o sources/snapshots/rhinoscript/view_methods/isbackgroundbitmap.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isdetail.htm -o sources/snapshots/rhinoscript/view_methods/isdetail.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/islayout.htm -o sources/snapshots/rhinoscript/view_methods/islayout.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isview.htm -o sources/snapshots/rhinoscript/view_methods/isview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isviewcurrent.htm -o sources/snapshots/rhinoscript/view_methods/isviewcurrent.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isviewmaximized.htm -o sources/snapshots/rhinoscript/view_methods/isviewmaximized.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isviewoutofplan.htm -o sources/snapshots/rhinoscript/view_methods/isviewoutofplan.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isviewperspective.htm -o sources/snapshots/rhinoscript/view_methods/isviewperspective.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/isviewtitlevisible.htm -o sources/snapshots/rhinoscript/view_methods/isviewtitlevisible.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/iswallpaper.htm -o sources/snapshots/rhinoscript/view_methods/iswallpaper.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/maximizerestoreview.htm -o sources/snapshots/rhinoscript/view_methods/maximizerestoreview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/namedcplane.htm -o sources/snapshots/rhinoscript/view_methods/namedcplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/namedcplanes.htm -o sources/snapshots/rhinoscript/view_methods/namedcplanes.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/namedviews.htm -o sources/snapshots/rhinoscript/view_methods/namedviews.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/renameview.htm -o sources/snapshots/rhinoscript/view_methods/renameview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/restorenamedcplane.htm -o sources/snapshots/rhinoscript/view_methods/restorenamedcplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/restorenamedview.htm -o sources/snapshots/rhinoscript/view_methods/restorenamedview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/rotatecamera.htm -o sources/snapshots/rhinoscript/view_methods/rotatecamera.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/rotateview.htm -o sources/snapshots/rhinoscript/view_methods/rotateview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/showgrid.htm -o sources/snapshots/rhinoscript/view_methods/showgrid.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/showgridaxes.htm -o sources/snapshots/rhinoscript/view_methods/showgridaxes.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/showviewtitle.htm -o sources/snapshots/rhinoscript/view_methods/showviewtitle.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/showworldaxes.htm -o sources/snapshots/rhinoscript/view_methods/showworldaxes.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/synchronizecplanes.htm -o sources/snapshots/rhinoscript/view_methods/synchronizecplanes.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/tiltview.htm -o sources/snapshots/rhinoscript/view_methods/tiltview.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/view_methods.htm -o sources/snapshots/rhinoscript/view_methods/view_methods.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcamera.htm -o sources/snapshots/rhinoscript/view_methods/viewcamera.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcameraicon.htm -o sources/snapshots/rhinoscript/view_methods/viewcameraicon.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcameralens.htm -o sources/snapshots/rhinoscript/view_methods/viewcameralens.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcameraplane.htm -o sources/snapshots/rhinoscript/view_methods/viewcameraplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcameratarget.htm -o sources/snapshots/rhinoscript/view_methods/viewcameratarget.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcameraup.htm -o sources/snapshots/rhinoscript/view_methods/viewcameraup.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewcplane.htm -o sources/snapshots/rhinoscript/view_methods/viewcplane.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymode.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymode.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymodeex.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymodeex.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymodeid.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymodeid.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymodename.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymodename.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymodeproperty.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymodeproperty.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewdisplaymodes.htm -o sources/snapshots/rhinoscript/view_methods/viewdisplaymodes.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewflatshade.htm -o sources/snapshots/rhinoscript/view_methods/viewflatshade.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewnames.htm -o sources/snapshots/rhinoscript/view_methods/viewnames.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewnearcorners.htm -o sources/snapshots/rhinoscript/view_methods/viewnearcorners.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewprojection.htm -o sources/snapshots/rhinoscript/view_methods/viewprojection.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewprojectionxform.htm -o sources/snapshots/rhinoscript/view_methods/viewprojectionxform.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewradius.htm -o sources/snapshots/rhinoscript/view_methods/viewradius.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewsize.htm -o sources/snapshots/rhinoscript/view_methods/viewsize.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewspeedtest.htm -o sources/snapshots/rhinoscript/view_methods/viewspeedtest.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewtarget.htm -o sources/snapshots/rhinoscript/view_methods/viewtarget.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/viewtitle.htm -o sources/snapshots/rhinoscript/view_methods/viewtitle.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/wallpaper.htm -o sources/snapshots/rhinoscript/view_methods/wallpaper.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/wallpapergrayscale.htm -o sources/snapshots/rhinoscript/view_methods/wallpapergrayscale.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/wallpaperhidden.htm -o sources/snapshots/rhinoscript/view_methods/wallpaperhidden.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/zoomboundingbox.htm -o sources/snapshots/rhinoscript/view_methods/zoomboundingbox.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/zoomextents.htm -o sources/snapshots/rhinoscript/view_methods/zoomextents.htm
mkdir -p sources/snapshots/rhinoscript/view_methods
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/view_methods/zoomselected.htm -o sources/snapshots/rhinoscript/view_methods/zoomselected.htm
mkdir -p sources/snapshots/rhinoscript
curl -L --fail --retry 3 --max-time 600 https://developer.rhino3d.com/api/rhinoscript/what_s_new_.htm -o sources/snapshots/rhinoscript/what_s_new_.htm
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhinowindows/index.json -o sources/snapshots/rhinowindows-versions.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/rhinowindows/8.35.26251.13001/rhinowindows.8.35.26251.13001.nupkg -o sources/snapshots/rhinowindows.8.35.26251.13001.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://github.com/mcneel/rhino-developer-samples/archive/8462fc3487f8b7a58595ef73f6a5c09f92717f60.tar.gz -o sources/snapshots/samples-8.tar.gz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.github.com/repos/mcneel/rhino-developer-samples/branches -o sources/snapshots/samples-branches.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/system.collections.immutable/9.0.0/system.collections.immutable.9.0.0.nupkg -o sources/snapshots/system.collections.immutable.9.0.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/system.reflection.metadata/9.0.0/system.reflection.metadata.9.0.0.nupkg -o sources/snapshots/system.reflection.metadata.9.0.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://api.nuget.org/v3-flatcontainer/system.text.encoding.codepages/7.0.0/system.text.encoding.codepages.7.0.0.nupkg -o sources/snapshots/system.text.encoding.codepages.7.0.0.nupkg
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz -o sources/snapshots/typescript-5.9.3.tgz
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://huggingface.co/api/models/Qwen/Qwen3.8-27B -o sources/snapshots/upstream-model.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://huggingface.co/Qwen/Qwen3.8-27B/resolve/1d4bf0f2ff6012fd82039f2fa52739d0dd7c60c0/tokenizer.json -o sources/snapshots/upstream-tokenizer.json
mkdir -p sources/snapshots
curl -L --fail --retry 3 --max-time 600 https://huggingface.co/Qwen/Qwen3.8-27B/resolve/1d4bf0f2ff6012fd82039f2fa52739d0dd7c60c0/tokenizer_config.json -o sources/snapshots/upstream-tokenizer_config.json
