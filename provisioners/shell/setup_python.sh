#!/usr/bin/env bash

echo "PYTHON - Starting installation"

sudo apt-get -y install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# install pyenv
echo "PYTHON - Installing pyenv"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.11
pyenv global 3.11

# install pipx
echo "PYTHON - Installing pipx"
python -m pip install pipx
python -m pipx ensurepath
export PATH="$PATH:/home/vagrant/.local/bin" # ensure pipx applications are usable

# install poetry
echo "PYTHON - Installing poetry"
pipx install poetry
poetry completions bash >> ~/.bash_completion
poetry config virtualenvs.in-project true
poetry config virtualenvs.prefer-active-python true

echo "export PYTHONDONTWRITEBYTECODE=1" >>  ~/.bashrc
