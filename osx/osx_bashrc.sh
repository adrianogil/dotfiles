source $DOTFILES_DIR/osx/export.sh
source $DOTFILES_DIR/osx/sublime.sh

# PYENV SETUP
if [ -d "$HOME/.pyenv" ]
then
    # (The below instructions are intended for common
	# shell setups. See the README for more guidance
	# if they don't apply and/or don't work for you.)

	# Add pyenv executable to PATH and
	# enable shims by adding the following
	# to ~/.profile:

	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"

	# If your ~/.profile sources ~/.bashrc,
	# the lines need to be inserted before the part
	# that does that. See the README for another option.

	# If you have ~/.bash_profile, make sure that it
	# also executes the above lines -- e.g. by
	# copying them there or by sourcing ~/.profile

	# Load pyenv into the shell by adding
	# the following to ~/.bashrc:

	eval "$(pyenv init -)"

	# Make sure to restart your entire logon session
	# for changes to profile files to take effect.

	# Load pyenv-virtualenv automatically by adding
	# the following to ~/.bashrc:

	eval "$(pyenv virtualenv-init -)"

	export WORKON_HOME=$PYENV_ROOT/virtualenvs/
	source $PYENV_ROOT/versions/3.9.6/bin/virtualenvwrapper.sh
fi

# SETUP Android path
if [ -d "$HOME/Library/Android" ]
then
	export ANDROID_HOME=${HOME}/Library/Android
	export ANDROID_SDK=${ANDROID_HOME}/sdk
	export PATH=${ANDROID_SDK}/platform-tools:$PATH
fi

function check-android-install()
{
	if [ -d "$HOME/Library/Android" ]
	then
		echo "Android SDK is installed"
	else
		echo "Android SDK is not installed"
	fi
}
