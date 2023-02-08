mkdir -p ~/.bash-profile-scripts/.source-scripts
cp ../*.sh ~/.bash-profile-scripts
cp ../source-scripts/*.sh ~/.bash-profile-scripts/.source-scripts
chmod 0600 ~/.bash-profile-scripts/*
chmod 0700 ~/.bash-profile-scripts/.source-scripts
chmod 0600 ~/.bash-profile-scripts/.source-scripts/*
if ! grep -q "dw-source-scripts" ~/.bash_profile
then 
	echo "" >> ~/.bash_profile
	echo "# For sourcing my scripts" >> ~/.bash_profile
	echo "source ~/.bash-profile-scripts/.source-scripts/dw-source-scripts.sh" >> ~/.bash_profile
fi

if ! grep -q "dw-source-scripts" ~/.bashrc
then 
	echo "" >> ~/.bashrc
	echo "# For sourcing my scripts" >> ~/.bashrc
	echo "source ~/.bash-profile-scripts/.source-scripts/dw-source-scripts.sh" >> ~/.bashrc
fi