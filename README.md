# https://cst438-gymapp.herokuapp.com/
# CST 348 Project Proposal
## Christopher Andaya, Austin Walker
# Gym Membership System
# Overview
The gym membership system is a CSUMB student project for a  gym membership system will include a website where a user will be able to log-in and view their membership information. 
- Pivotal Tracker: https://www.pivotaltracker.com/n/projects/2317969
- Github: https://github.com/andaya92/cst438
## Requirements
- Web application
- Mobile support
- Database Records 
- User account registration
- User login and authentication
- Users can view other users accounts
- Users can view and edit billing information
- User can view and log their own workouts on the mobile application
- Users can check themselves into the web app and view other users that have checked in
- Admins can delete user accounts 



# Database access via console
Login to Postgres from ec2-user
psql postgres

# Start/ stop postgresql-server
sudo service postgresql start
sudo service postgresql stop

# Makes assets/js files available
bundle exec rake assets:precompile


# Deploy
git add .
git commit -am "Changed"
git push heroku master
