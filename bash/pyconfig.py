#!/usr/bin/env python3
import re
import sys
filepath="360glinet.config"
config=sys.argv[1]     # .config

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
            #print(res0,type(res0))
            content=content.replace(res[0], f"{line}=y", 3)
    else:
        # print(line)
        pass
    line = f.readline()
f.close()

#print(f"content: {type(content)}")
# 读取第二个配置
try:
    banconfig=sys.argv[2]     # 2.config
except:
    print('没有banconfig')
else:
    f = open(banconfig)  # 返回一个文件对象
    line = f.readline()  # 调用文件的 readline()方法
    while line:
        line = line.strip('\n')
        print(line)
        if line in content:
            # print(re.sub(f'{line}', '# {line}', content))
            res = re.findall(f'{line}=y', content)
            if isinstance(res, list) is True and len(res) != 0:
                res0 = res[0]
                print(res0,type(res0))
                # content = content.replace(res[0], f"# {line}= is not set", 3)
                content = content.replace(res[0], f"{line}=m")
                result = line
            else:
                print('没有相关依赖')
        else:
            print('没有相关依赖')
        line = f.readline()
    f.close()
with open('2.config','w') as f: # 'a'表示append,即在原来文件内容后继续写数据（不清楚原有数据）
    f.write(content)
