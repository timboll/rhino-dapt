// Parse declarations and public Compute object members without evaluating source.
const fs=require('fs');
const ts=require('../tools/typescript/package/lib/typescript.js');
const input=JSON.parse(fs.readFileSync(process.argv[2],'utf8'));
const result=[];
for(const s of input){
 const code=fs.readFileSync(s.cache_path,'utf8');
 const sf=ts.createSourceFile(s.archive_path,code,ts.ScriptTarget.Latest,true,s.archive_path.endsWith('.ts')?ts.ScriptKind.TS:ts.ScriptKind.JS);
 if(sf.parseDiagnostics.length)throw Error(JSON.stringify(sf.parseDiagnostics.map(d=>({source:s.id,message:ts.flattenDiagnosticMessageText(d.messageText,' ')}))));
 function emit(n,path,kind){
  const start=n.getStart(sf);const line=sf.getLineAndCharacterOfPosition(start).line+1;
  result.push({id:'sourceapi|'+s.id+'|'+path+'|'+line,source_id:s.id,api_family:s.api_family,qualified_name:path,name:path.split('.').pop(),kind,namespace:s.api_family,line,end_line:sf.getLineAndCharacterOfPosition(n.end).line+1,signature:n.getText(sf),documented:!!(n.jsDoc&&n.jsDoc.length),inventory_method:'TypeScript 5.9.3 AST; declaration spelling and overload positions retained'});
 }
 function decl(n,parents=[]){
  const isContainer=ts.isModuleDeclaration(n)||ts.isClassDeclaration(n)||ts.isInterfaceDeclaration(n)||ts.isEnumDeclaration(n);
  if(isContainer){const p=[...parents,n.name?n.name.getText(sf):'<anonymous>'];emit(n,p.join('.'),ts.SyntaxKind[n.kind]);ts.forEachChild(n,c=>decl(c,p));return;}
  if(ts.isMethodSignature(n)||ts.isMethodDeclaration(n)||ts.isPropertyDeclaration(n)||ts.isPropertySignature(n)||ts.isConstructorDeclaration(n)||ts.isFunctionDeclaration(n)||ts.isEnumMember(n)||ts.isIndexSignatureDeclaration(n)||ts.isCallSignatureDeclaration(n)||ts.isConstructSignatureDeclaration(n)||ts.isTypeAliasDeclaration(n)||ts.isGetAccessorDeclaration(n)||ts.isSetAccessorDeclaration(n)){
   emit(n,[...parents,n.name?n.name.getText(sf):ts.SyntaxKind[n.kind]].join('.'),ts.SyntaxKind[n.kind]);return;
  }
  ts.forEachChild(n,c=>decl(c,parents));
 }
 function object(n,path){for(const p of n.properties){if(!p.name)continue;const name=path+'.'+p.name.getText(sf);emit(p,name,ts.SyntaxKind[p.kind]);if(p.initializer&&ts.isObjectLiteralExpression(p.initializer))object(p.initializer,name);}}
 if(s.archive_path.endsWith('.d.ts'))decl(sf);
 else for(const st of sf.statements)if(ts.isVariableStatement(st))for(const d of st.declarationList.declarations)if(d.name.getText(sf)==='RhinoCompute'&&d.initializer&&ts.isObjectLiteralExpression(d.initializer))object(d.initializer,'RhinoCompute');
}
fs.writeFileSync(process.argv[3],result.map(r=>JSON.stringify(r)).join('\n')+'\n');
