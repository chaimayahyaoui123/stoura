
# Configure Yarn to use the specified cache folder
RUN yarn config set cache-folder $YARN_CACHE_FOLDER

# Display yarn cache list (optional)
RUN yarn cache list

# Install dependencies
RUN YARN_CACHE_FOLDER=$YARN_CACHE_FOLDER yarn install --network-timeout=600000 --frozen-lockfile

# Install npm dependencies
RUN yarn install

# Copy all the project files to the working directory
COPY . .

# Expose the port of your application to bind with the host port
EXPOSE 3000

# run your app
#CMD ['yarn', 'run', 'start']
