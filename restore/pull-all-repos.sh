#!/bin/bash
# Text formatting
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Initialize counters
total_repos=0
success_pulls=0
failed_pulls=0
skipped_repos=0

# Save the current directory
original_dir=$(pwd)

# Check if we're in the ~/gh directory, if not, change to it
if [ "$(pwd)" != "$HOME/gh" ]; then
    echo -e "${YELLOW}Changing directory to ~/gh${NC}"
    cd ~/gh || { echo -e "${RED}Error: Cannot change to ~/gh directory${NC}"; exit 1; }
fi

# Save the base directory
base_dir=$(pwd)

echo -e "${BLUE}Starting to pull all repositories...${NC}\n"

# Create a log file
log_file="$HOME/gh/pull-repos-log-$(date +%Y%m%d-%H%M%S).log"
echo "Pull Repository Log $(date)" > "$log_file"
echo "===============================" >> "$log_file"

# Find all .git directories, excluding the .git directory itself if it exists
find . -type d -name ".git" ! -path "./.git" | while read -r gitdir; do
    # Get the parent directory of the .git folder (the actual repo directory)
    repo_dir=$(dirname "$gitdir")
    repo_name=${repo_dir#./}

    echo -e "${BLUE}Pulling${NC} ${repo_name}"
    echo "Pulling $repo_name..." >> "$log_file"

    total_repos=$((total_repos + 1))

    # Use absolute path for the repository directory
    absolute_repo_dir="$base_dir/$repo_dir"

    # Change to the repository directory
    if ! cd "$absolute_repo_dir"; then
        echo -e "  ${RED}Could not change to directory ${repo_name}${NC}"
        echo "  Could not change to directory $repo_name" >> "$log_file"
        skipped_repos=$((skipped_repos + 1))
        continue
    fi

    # Check if the repository has a remote
    if ! git remote -v | grep -q "fetch"; then
        echo -e "  ${YELLOW}No remote found for ${repo_name}${NC}"
        echo "  No remote found for $repo_name" >> "$log_file"
        skipped_repos=$((skipped_repos + 1))
        cd "$base_dir"
        continue
    fi

    # Pull changes
    pull_output=$(git pull 2>&1)
    pull_status=$?

    echo "$pull_output" >> "$log_file"

    if [ $pull_status -eq 0 ]; then
        if echo "$pull_output" | grep -q "Already up to date"; then
            echo -e "  ${GREEN}Already up to date${NC}"
        else
            echo -e "  ${GREEN}Successfully pulled changes${NC}"
        fi
        success_pulls=$((success_pulls + 1))
    else
        # Check for authentication issues
        if echo "$pull_output" | grep -q "Support for password authentication was removed"; then
            echo -e "  ${RED}Authentication error: GitHub no longer supports password authentication${NC}"
            echo -e "  ${YELLOW}Suggestion: Set up SSH authentication or use a personal access token${NC}"
            echo "  AUTH ERROR: GitHub no longer supports password authentication" >> "$log_file"
        else
            echo -e "  ${RED}Failed to pull: $(echo "$pull_output" | head -1)${NC}"
            echo "  Failed to pull: $pull_output" >> "$log_file"
        fi
        failed_pulls=$((failed_pulls + 1))
    fi

    # Return to the base directory
    cd "$base_dir"
    echo ""
done

# Return to the original directory
cd "$original_dir" || true

# Display summary
echo -e "${BLUE}Pull Summary:${NC}"
echo -e "  ${BLUE}Total repositories:${NC} $total_repos"
echo -e "  ${GREEN}Successfully pulled:${NC} $success_pulls"
echo -e "  ${YELLOW}Skipped repositories:${NC} $skipped_repos"
echo -e "  ${RED}Failed to pull:${NC} $failed_pulls"
echo -e "${GREEN}All repositories have been processed!${NC}"
echo -e "Log file created at: ${YELLOW}$log_file${NC}"