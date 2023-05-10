import os, sys
path = os.environ.get('DEMO_VAR')
if path:
    print(os.listdir(path))
else:
    print('Env var not set!')
