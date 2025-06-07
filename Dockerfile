# Base image
FROM mysterysd/wzmlx:latest

# Set working directory
WORKDIR /usr/src/app

# Make sure the directory is writable
RUN chmod 777 /usr/src/app

# Copy the requirements first to leverage Docker caching
COPY requirements.txt .

# Upgrade pip tools and install dependencies
RUN pip3 install --upgrade setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

# Ensure README.md exists (create a dummy if not copied)
COPY . .

# Safety net in case README.md doesn't exist
RUN [ -f "README.md" ] || echo "# WZML-X" > README.md

# Set default command
CMD ["bash", "start.sh"]
