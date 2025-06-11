#!/bin/bash

echo "Starting setup for Jekyll environment..."

# Check for Ruby installation
if ! command -v ruby &> /dev/null
then
    echo "Ruby not found. Installing Ruby and build essentials..."
    sudo apt update
    sudo apt install -y ruby-full build-essential zlib1g-dev
    # Enable gem executables if not already in PATH
    echo '# Install Ruby Gems to ~/.gem/ruby/X.Y.Z/bin' >> ~/.bashrc
    echo 'export PATH="$HOME/.gem/ruby/$(ruby -e 'print RUBY_VERSION')/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Ruby is already installed."
fi

# Check for Bundler installation
if ! command -v bundle &> /dev/null
then
    echo "Bundler not found. Installing Bundler..."
    gem install bundler
else
    echo "Bundler is already installed."
fi

echo "Installing Jekyll and other dependencies with Bundler..."
bundle install

echo "Setup complete. You can now run 'bundle exec jekyll serve' to start the server." 