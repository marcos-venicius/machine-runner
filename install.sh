cp .machinesrc $HOME

if [[ "$SHELL" =~ bash$ ]]; then
  echo "source $HOME/.machinesrc" >> $HOME/.bashrc
fi

if [[ "$SHELL" =~ zsh$ ]]; then
  echo "source $HOME/.machinesrc" >> $HOME/.zshrc
fi

echo -e "\033[1;32mMACHINE RUNNER INSTALLED SUCCESSFULLY\033[0m"
echo -e "\033[1;36mPLEASE, RESTART YOUR TERMINAL\033[0m"
