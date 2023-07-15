apt-get update
apt-get --fix-broken install -y
apt-get upgrade -y
apt-get install -y vim tmux python3-venv libgoogle-perftools4 libtcmalloc-minimal4
adduser --disabled-password --gecos "" u
chown u:u -R /workspace
git config --global --add safe.directory *

clone_or_pull() {
  local dir=$1
  local repo=$2
  local branch=$3
  
  if [ -d "$dir" ]; then
    cd "$dir"
    git pull origin "$branch"
  else
    git clone --depth 1 "$repo" -b "$branch"
  fi
}

cd /workspace
clone_or_pull "stable-diffusion-webui" \
             "https://github.com/AUTOMATIC1111/stable-diffusion-webui" \
             "master"

if [ -d "/workspace/stable-diffusion-webui/extensions" ]; then
  cd /workspace/stable-diffusion-webui/extensions
  clone_or_pull "kandinsky-for-automatic1111" \
               "https://github.com/MMqd/kandinsky-for-automatic1111" \
               "main"
fi

tmux kill-session -t mysession 2>/dev/null
tmux new-session -d -s mysession 'bash -c "su u; /workspace/stable-diffusion-webui/webui.sh --listen --skip-torch-cuda-test"'
