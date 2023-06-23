# Stage 1: Build React.js application
FROM node:14.17.0 as build-stage

WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the entire application
COPY . .

# Build the React.js application
RUN npm run build

# Stage 2: Create production-ready image
FROM nginx:1.21.0-alpine as production-stage

# Copy built artifacts from the build-stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration (if required)
COPY nginx.conf /etc/nginx/conf.d

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

