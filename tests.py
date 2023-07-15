import requests 

url = 'http://localhost:7860'

payload = {
  'prompt': 'a cute puppy',
  'steps': 20,
  'cfg_scale': 7#,
  'override_settings': {
    'scripts': {
      'format': 'grid',
      'postprocessing': 'custom_scripts/enhance.py' 
    }
  }
}

response = requests.post(f'{url}/sdapi/v1/txt2img', json=payload)
