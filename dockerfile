# Use node as the base image
FROM node:21

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock first to leverage Docker cache
COPY package.json yarn.lock ./

# Install npm and dependencies
RUN npm install -g npm@10.9.0
RUN yarn install --frozen-lockfile

# Copy the rest of the application files
COPY . .

# Expose the required port for the Medusa backend
EXPOSE 9000

# Set environment variables (configure for production)
ENV NODE_ENV=production
ENV PORT=9000

# Start the Medusa backend
CMD ["yarn", "start"]
