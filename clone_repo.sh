echo "Enter GitHub repository URL:"
read repo_url

# Check if input is empty
if [ -z "$repo_url" ]; then
    echo " Error: Repository URL cannot be empty."
    exit 1
fi

# Extract repository name from URL
repo_name=$(basename "$repo_url" .git)

# Check if folder already exists
if [ -d "$repo_name" ]; then
    echo " Warning: Folder '$repo_name' already exists. Skipping cloning."
    exit 0
fi

# Clone the repository
echo "Cloning repository..."
git clone "$repo_url"

# Check if clone was successful
if [ $? -eq 0 ]; then
    # Count number of files downloaded
    file_count=$(find "$repo_name" -type f | wc -l)

    echo "----------------------------------------"
    echo " Repository cloned successfully!"
    echo " Folder name: $repo_name"
    echo " Total files downloaded: $file_count"
    echo "----------------------------------------"
else
    echo " Failed to clone repository."
fi