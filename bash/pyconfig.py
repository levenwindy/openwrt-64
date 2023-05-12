#!/usr/bin/env python3
import re
import sys
filepath="360glinet.config"
config=sys.argv[1]
#for line in open(filepath):
#    print(line)
f = open(config)
content = f.read()
f.close()
f = open(filepath)  # 返回一个文件对象
line = f.readline()  # 调用文件的 readline()方法
while line:
    line = line.strip('\n')
    if line in content:
        #print(re.sub(f'{line}', '# {line}', content))
        res = re.findall(f'# {line} is not set', content)
        if isinstance(res, list) is True and len(res) != 0 :
            res0 = res[0]
            print(res0,type(res0))
            content=content.replace(res[0], f"{line}=y", 3)
    else:
        # print(line)
        pass
    line = f.readline()
f.close()
print(content)
with open(config,'a') as f: # 'a'表示append,即在原来文件内容后继续写数据（不清楚原有数据）
    f.write(content)
