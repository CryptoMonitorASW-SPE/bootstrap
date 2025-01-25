#!/bin/bash

original_dir=$(pwd)
all_success=0

# Check if src directory exists
if [ ! -d "./src" ]; then
    echo "Error: src directory not found."
    exit 1
fi

# Handle case with no project directories
shopt -s nullglob
directories=(./src/*/)
shopt -u nullglob

if [ ${#directories[@]} -eq 0 ]; then
    echo "No project directories found in src."
    exit 1
fi

# Process each project directory
for dir in "${directories[@]}"; do
    echo "Processing $dir"
    
    # Enter directory
    if ! cd "$dir"; then
        echo "  Error: Failed to enter directory"
        all_success=1
        cd "$original_dir" || exit 1
        continue
    fi
    
    # Git fetch
    if ! git fetch; then
        echo "  Error: git fetch failed"
        all_success=1
        cd "$original_dir" || exit 1
        continue
    fi
    
    # Checkout develop branch
    if ! git checkout develop; then
        echo "  Error: checkout develop failed"
        all_success=1
        cd "$original_dir" || exit 1
        continue
    fi
    
    # Pull latest changes
    if ! git pull; then
        echo "  Error: git pull failed"
        all_success=1
        cd "$original_dir" || exit 1
        continue
    fi
    
    # Return to original directory
    cd "$original_dir" || exit 1
done

# Final status report
if [ $all_success -eq 0 ]; then
    echo "All repositories updated and pulled successfully."
else
    echo "Some repositories encountered errors during update."
fi

exit $all_success