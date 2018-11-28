#!/bin/bash

# Update packages

echo "Updating Packages..."
sudo apt-get update

# Install Postgres
echo "Installing Postgres..."
sudo apt-get install postgresql postgresql-contrib libpq-dev

# Set up Postgres
echo "Setting up Postgres for user..."
sudo pkexec --user postgres psql -c 'CREATE ROLE vsts WITH createdb;'
sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH superuser;'
sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH login;'

# Install the required gems
echo "Installing required gems..."
gem install bundler pg rails

# Install rails app dependencies
echo "Installing dependencies..."
bundle

# Create and migrate rails dbs
echo "Creating rails developement and test DBs..."
rails db:create
rails db:migrate

# Run rspec tests
echo "Running tests..."
rake test
