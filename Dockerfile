# Use Node.js image to build the Angular app
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Angular project files
COPY . .

# Build the Angular application
RUN npm run build --prod

# Use Nginx to serve the built Angular app
FROM nginx:alpine

# Copy the Angular build files to Nginx's public folder
COPY --from=build /app/dist/frontend /usr/share/nginx/html 

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
