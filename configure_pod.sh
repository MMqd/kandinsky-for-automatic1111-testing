apt-get update
apt-get --fix-broken install -y
apt-get upgrade -y
apt-get install -y vim tmux python3-venv libgoogle-perftools4 libtcmalloc-minimal4
cd /workspace
adduser --disabled-password --gecos "" u
chown u:u -R /workspace

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

cd /workspace/stable-diffusion-webui/extensions
git clone https://github.com/MMqd/kandinsky-for-automatic1111

tmux kill-session -t mysession 2>/dev/null
tmux new-session -d -s mysession 'bash -c "https://github.com/MMqd/kandinsky-for-automatic1111/webui.sh --listen"'
