# Use Node.js 20.x.x LTS as the base image
FROM node:20

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock files to the working directory
COPY package.json yarn.lock ./

# Install yarn globally if not already installed and install dependencies
RUN if [ ! -f /usr/local/bin/yarn ]; then npm install --global yarn; fi && yarn install --frozen-lockfile

# Copy the application code into the container
COPY . .

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["yarn", "start"]
