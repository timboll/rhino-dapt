import re

def newer_than_target(value,target='8.35'):
 parts=re.match(r'^\s*(\d+)(?:\.(\d+))?',value or '')
 if not parts:return False
 version=(int(parts[1]),int(parts[2] or 0));limit=tuple(map(int,target.split('.')[:2]))
 return version>limit
