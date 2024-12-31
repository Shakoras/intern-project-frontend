# Use Node.js image to build the Angular app
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Configure DNS to avoid network issues
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies using npm ci for faster and more reliable installs
RUN npm ci --prefer-offline

# Copy the rest of the Angular project files
COPY . .

# Build the Angular application
RUN npm run build --prod || (echo "Retrying npm build..." && npm run build --prod)

# Use Nginx to serve the built Angular app
FROM nginx:alpine

# Copy the Angular build files to Nginx's public folder
COPY --from=build /app/dist/frontend /usr/share/nginx/html 

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
