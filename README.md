# README

Prerequisites
The setups steps expect following tools installed on the system.
  * Git
  * Ruby 3.0.0
  * Rails 6.1.4


1. Check out the repository
  * git clone https://github.com/Tayyab-at-Devsinc/dinner_dash_project.git

2. Create database.yml file
Copy the sample database.yml file and edit the database configuration as required.

cp config/database.yml.sample config/database.yml
3. Create and setup the database
  * Run the following commands to create and setup the database:
      * bundle exec rake db:create
      * bundle exec rake db:setup

4. Start the Rails server
  * You can start the rails server using the command given below.
    * rails s


And now you can visit the site with the URL http://localhost:3000
