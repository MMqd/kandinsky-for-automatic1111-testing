apt-get update
apt-get --fix-broken install -y
apt-get upgrade -y
apt-get install -y vim tmux python3-venv libgoogle-perftools4 libtcmalloc-minimal4
adduser --disabled-password --gecos "" u
chown u:u -R /workspace
git config --global --add safe.directory *

UI_NAME="automatic"

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

if [ $UI_NAME == "automatic"]; then
  clone_or_pull "stable-diffusion-webui" \
               "https://github.com/AUTOMATIC1111/stable-diffusion-webui" \
               "master"
else
  clone_or_pull "automatic" \
               "https://github.com/vladmandic/automatic" \
               "master"
fi

if [ -d "/workspace/stable-diffusion-webui/extensions" ]; then
  cd /workspace/$UI_NAME/extensions
  clone_or_pull "kandinsky-for-automatic1111" \
               "https://github.com/MMqd/kandinsky-for-automatic1111" \
               "main"
else
  echo -e "\033[1;31mno webui directory found\033[0m"
fi
yy
tmux kill-session -t mysession 2>/dev/null
sudo -u u tmux new-session -d -s mysession 'bash -c "/workspace/$UI_NAME/webui.sh --listen --skip-torch-cuda-test"'
