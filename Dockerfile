# Base our image on an official, minimal image of our preferred Ruby
FROM ruby:2.4.2

 # Define where our application will live inside the image
 ENV APP_HOME /tableGameSite
 
 # Install essential Linux packages
 RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
 # RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
 
 # Create application home. App server will need the pids dir so just create everything in one shot
 RUN mkdir $APP_HOME
 
 # Set our working directory inside the image
 WORKDIR $APP_HOME
 ADD Gemfile $APP_HOME
 ADD Gemfile.lock $APP_HOME
 
 # Finish establishing our Ruby enviornment
 RUN bundle install
 ADD . $APP_HOME