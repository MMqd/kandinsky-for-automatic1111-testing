apt-get update
apt-get --fix-broken install -y
apt-get upgrade -y
apt-get install -y vim tmux python3-venv libgoogle-perftools4 libtcmalloc-minimal4
cd /workspace
adduser --disabled-password --gecos "" u
chown u:u -R /workspace

tmux new-session -d -s mysession
