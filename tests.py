import subprocess

subprocess.check_call(["pip", "install", "webuiapi", "--break-system-packages"])

import webuiapi
import requests 

api = webuiapi.WebUIApi(host='127.0.0.1', port=7860)

result1 = api.txt2img(prompt="cute squirrel",
                    negative_prompt="ugly, out of frame",
                    seed=1003,
                    styles=["anime"],
                    cfg_scale=7,
                    )
