from common import *
import subprocess,sys,platform,shutil
versions={}
for tool,args in [('python3',['--version']),('dotnet',['--info']),('doxygen',['--version']),('clang++',['--version']),('node',['--version'])]:
 p=subprocess.run([tool]+args,capture_output=True,text=True);versions[tool]={'path':shutil.which(tool),'exit_code':p.returncode,'version_output':p.stdout+p.stderr}
jsonwrite('manifest/build_environment.json',{'platform':platform.platform(),'orchestration_python':sys.version,'tools':versions,'parser':'Microsoft.CodeAnalysis 4.14.0 with exact cached NuGet dependencies, running on .NET6','tokenizer':'see manifest/tokenizer.json; separate Python3.11 runtime','no_model_loaded':True,'no_training':True})
