# DO NOT USE THIS REPOSITORY IT ONLY CONTAINS SCRIPTS FOR TESTING
Scripts used to test the kandinsky-for-automatic1111 extension

To run installer:
`wget -O - https://raw.githubusercontent.com/MMqd/kandinsky-for-automatic1111-testing/main/configure_pod.sh | bash`

To run the tests:
`wget -O - https://raw.githubusercontent.com/MMqd/kandinsky-for-automatic1111-testing/main/tests.py | python`

# Recommended Pod Configuration
* container disk: 20 GB
* volume disk: 100 GB
* Expose HTTP Ports: 8888,7860
* \>1 GPU to unlock >512 MB RAM
