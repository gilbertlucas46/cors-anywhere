# Use the official Node.js image
FROM node:14

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy the package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8888

# Define environment variables (optional, can also be set in Coolify)
ENV HOST=0.0.0.0
ENV PORT=8888

# Run the application
CMD ["node", "main.js"]
