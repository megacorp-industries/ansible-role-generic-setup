# Define the list of shell executables to try
declare -a shells=("zsh" "bash")

# Loop through the list of shells and try to execute them
for shell in "${shells[@]}"; do
    if command -v "$shell" >/dev/null 2>&1; then
        exec "$shell"  # Replace the current script with the selected shell
    fi
done

# If none of the shells are found, print an error message
echo "No supported shell found."
exit 1
