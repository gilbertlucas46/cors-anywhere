# Use the official Node.js image with version 18
FROM node:18

# Install pnpm globally
RUN npm install -g pnpm

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN pnpm install

# Copy the rest of the application code, excluding node_modules
COPY . .

# Expose the port the app runs on
EXPOSE 8888

# Define environment variables (optional, can also be set in Coolify)
ENV HOST=0.0.0.0
ENV PORT=8888

# Run the application
CMD ["node", "main.js"]
