# Use the official Ruby image as the base image
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code to the container
COPY . .

# Set the command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
