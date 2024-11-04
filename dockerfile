# Use node as the base image
FROM node:21

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json yarn.lock ./
RUN npm install -g npm@10.9.0
RUN yarn install

# Copy the rest of the application files
COPY . .

# Expose the required port for the Medusa backend
EXPOSE 9000

# Set environment variables (configure for production)
ENV NODE_ENV=production
ENV PORT=9000

# Start the Medusa backend
CMD ["yarn", "start"]
