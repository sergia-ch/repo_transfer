import sys, os

# map dir -> str config
configs = {}

buf = []
for l in open('output.txt', 'r').readlines():
  l = l.strip()
  if l.startswith('== git repo'):
    buf = [l[12:-3], ""]
  elif l.startswith('== end =='):
    configs[buf[0]] = buf[1]
  else:
    buf[1] += l + "\n"

for path, conf in configs.items():
  print(path, conf)
