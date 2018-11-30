#!/bin/bash

# Update packages
echo "------------------------"
echo "| Updating Packages... |"
echo "------------------------"
sleep 0.5s
sudo apt-get update

# Install Postgres
echo "--------------------------"
echo "| Installing Postgres... |"
echo "--------------------------"
sleep 0.5s
sudo apt-get install postgresql postgresql-contrib libpq-dev

# Set up Postgres
echo "--------------------------"
echo "| Setting up Postgres... |"
echo "--------------------------"
sleep 0.5s
echo "sudo pkexec --user postgres psql -c 'CREATE ROLE vsts WITH createdb;'"
sudo pkexec --user postgres psql -c 'CREATE ROLE vsts WITH createdb;'
echo "sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH superuser;'"
sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH superuser;'
echo "sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH login;'"
sudo pkexec --user postgres psql -c 'ALTER ROLE vsts WITH login;'

# Install the required gems
echo "----------------------------"
echo "| Installing required gems |"
echo "----------------------------"
sleep 0.5s
gem install bundler pg rails

# Install rails app dependencies
echo "------------------------------------"
echo "| Installing Rails dependencies... |"
echo "------------------------------------"
sleep 0.5s
bundle

# Create and migrate rails dbs
echo "-----------------------------------------------"
echo "| Creating and migrating data to Rails DBs... |"
echo "-----------------------------------------------"
sleep 0.5s
rails db:create
rails db:migrate

# Run rspec tests
echo "--------------------"
echo "| Running tests... |"
echo "--------------------"
sleep 0.5s
rspec spec
