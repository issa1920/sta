#!/bin/bash

# Step 1: Install Git (if not already installed)

# Step 2: Set up Git configurations
read -p "Enter your Git username: " git_username
read -p "Enter your Git email address: " git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"

# Step 3: Generate an SSH key (if not already generated)
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 4096 -C "$git_email"
fi

# Step 4: Add SSH key to Git account
echo "Please copy the following SSH public key and add it to your Git account:"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
read -p "Press Enter to continue..."

# Step 5: Configure Git to use the SSH key
git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa"

# Step 6: Link Git account with all terminals
echo "Linking Git account with all terminals..."
echo "export GIT_SSH_COMMAND=\"ssh -i ~/.ssh/id_rsa\"" >> ~/.bashrc
echo "export GIT_SSH_COMMAND=\"ssh -i ~/.ssh/id_rsa\"" >> ~/.zshrc
echo "export GIT_SSH_COMMAND=\"ssh -i ~/.ssh/id_rsa\"" >> ~/.bash_profile

echo "Git configuration completed!"

# Step 7: Reload terminal configuration
source ~/.bashrc
source ~/.zshrc
source ~/.bash_profile

