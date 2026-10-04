from common import *
# Explicit official URLs for all acquired evidence. These are never promoted into training text.
URLS={
'deployment-README.md':'https://huggingface.co/gcoli/Qwen3.8-27B-oQ6e-mtp/raw/main/README.md',
'upstream-model.json':'https://huggingface.co/api/models/Qwen/Qwen3.8-27B',
'upstream-tokenizer.json':'https://huggingface.co/Qwen/Qwen3.8-27B/resolve/1d4bf0f2ff6012fd82039f2fa52739d0dd7c60c0/tokenizer.json',
'upstream-tokenizer_config.json':'https://huggingface.co/Qwen/Qwen3.8-27B/resolve/1d4bf0f2ff6012fd82039f2fa52739d0dd7c60c0/tokenizer_config.json',
'cpp-index.html':'https://developer.rhino3d.com/api/cpp/',
'cpp8-download.html':'https://www.rhino3d.com/download/rhino-sdk/8/latest/',
'cpp8-details.json':'https://www.rhino3d.com/www-api/download/details?slug=rhino-sdk/8/latest&platform=windows',
'rh835sdk_8.35.26251.13001.msi':'https://files.mcneel.com/dujour/exe/202609/rh835sdk_8.35.26251.13001.msi',
'download-site.js':'https://www.rhino3d.com/vue-site/assets/index.e4308a7e.js',
'7zip-download.html':'https://www.7-zip.org/download.html',
'7z2603-mac.tar.xz':'https://github.com/ip7z/7zip/releases/download/26.03/7z2603-mac.tar.xz',
'guides-targetdate.tar.gz':'https://github.com/mcneel/developer.rhino3d.com/archive/659b479af0b6a6a8144f250797ea0a6450fc2e60.tar.gz',
'guides-targetdate-commit.json':'https://api.github.com/repos/mcneel/developer.rhino3d.com/commits?until=2026-09-08T23:59:59Z&per_page=1',
'netcore-history.json':'https://api.github.com/repos/mcneel/developer.rhino3d.com/commits?path=content/en/guides/rhinocommon/moving-to-dotnet-core/index.md&until=2026-01-01T00:00:00Z&per_page=1',
'netcore-rhino8.md':'https://raw.githubusercontent.com/mcneel/developer.rhino3d.com/6e4aa57c1598706b3d729384b59cbf55c95615f9/content/en/guides/rhinocommon/moving-to-dotnet-core/index.md',
'opennurbs-commit.json':'https://api.github.com/repos/mcneel/opennurbs/commits/eb92af3ba1806b0a34a99aba0d3bda83e3d46083',
'opennurbs-branches.json':'https://api.github.com/repos/mcneel/opennurbs/branches',
'samples-branches.json':'https://api.github.com/repos/mcneel/rhino-developer-samples/branches',
'guides-branches.json':'https://api.github.com/repos/mcneel/developer.rhino3d.com/branches'}
sources={s['id']:s for s in rows('manifest/sources.jsonl')};downloads=readj('config/downloads.json');paths={d['path'] for d in downloads}
for name,url in URLS.items():
 path=ROOT/'sources/snapshots'/name
 if not path.exists():continue
 h,c=cache(path);sid='evidence:'+name
 if sid in sources:assert sources[sid]['sha256']==h,'Cached evidence changed: '+name
 sources.setdefault(sid,{'id':sid,'source_location':url,'cache_path':c,'sha256':h,'retrieved_at':stamp(),'version':'pinned evidence; see URL / payload','owner':'respective official publisher','source_type':'discovery_evidence','redistribution_reviewed':False})
 rel=str(path.relative_to(ROOT))
 if rel not in paths:downloads.append({'url':url,'path':rel,'sha256':h,'immutable_url':'/resolve/' in url or '/archive/' in url or '/releases/download/' in url or name.endswith('.msi')})
for s in sources.values():
 if s['source_type']=='package_archive':
  rel='sources/snapshots/'+Path(s['source_location']).name
  if rel not in {d['path'] for d in downloads}:downloads.append({'url':s['source_location'],'path':rel,'sha256':s['sha256'],'immutable_url':True})
jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)]);jsonwrite('config/downloads.json',sorted(downloads,key=lambda d:d['path']))
import shlex
write('scripts/download_sources.sh','#!/bin/sh\nset -eu\n# Pinned downloads; verify against config/downloads.json before ingestion.\ncd "$(dirname "$0")/.."\n'+''.join('mkdir -p '+shlex.quote(str(Path(d['path']).parent))+'\n'+'curl -L --fail --retry 3 --max-time 600 '+shlex.quote(d['url'])+' -o '+shlex.quote(d['path'])+'\n' for d in sorted(downloads,key=lambda d:d['path'])))
