#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
# Offline corpus preparation only. No model training and no split/packing decisions.
python3 scripts/check_integrity.py
python3 scripts/build_environment.py
python3 scripts/restore_cached.py
python3 scripts/extract_native_sdk.py
python3 scripts/inventory_dotnet.py
python3 scripts/inventory_excluded_loader.py
python3 scripts/inventory_cpp.py
python3 scripts/normalize_sources.py
DOTNET_CLI_HOME="$PWD/.dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet build scripts/ValidateCSharp --configfile NuGet.Config -v quiet -p:UseSharedCompilation=false
dotnet scripts/ValidateCSharp/bin/Debug/net6.0/ValidateCSharp.dll manifest/sources.jsonl manifest/csharp_validation.jsonl
python3 scripts/normalize_ecosystem.py
DOTNET_CLI_HOME="$PWD/.dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet build scripts/InventoryHost --configfile NuGet.Config -v quiet -p:UseSharedCompilation=false
dotnet scripts/InventoryHost/bin/Debug/net6.0/InventoryHost.dll
python3 scripts/normalize_inside.py
python3 scripts/audit_versions.py
python3 scripts/build_canonical.py
python3 scripts/segment.py
python3 scripts/deduplicate.py
python3 scripts/validate_symbols.py
python3 scripts/validate_coverage.py
python3 scripts/documentation_audit.py
python3 scripts/validate_ecosystem.py
python3 scripts/validate_code.py
DOTNET_CLI_HOME="$PWD/.dotnet-home" dotnet build scripts/ValidatePython2 --configfile NuGet.Config -v quiet -p:UseSharedCompilation=false
dotnet scripts/ValidatePython2/bin/Debug/net6.0/ValidatePython2.dll manifest/sources.jsonl manifest/python2_validation.jsonl
python3 scripts/validation_summary.py
python3 scripts/validate_guide_python.py
python3 scripts/build_derived.py
python3 scripts/export_corpus.py
scripts/tokenize.sh
python3 -m unittest discover -s tests -v > reports/tests.log 2>&1
python3 scripts/check_rebuild.py > reports/rebuild_check.log 2>&1
python3 scripts/check_integrity.py
python3 scripts/source_inventory.py
python3 scripts/reports.py
