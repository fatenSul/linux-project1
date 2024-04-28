#!/bin/bash

# Path to the user's command history file
HISTORY_FILE="$HOME/.bash_history"

# Number of top commands to display
TOP_N=5

# Function to get top N commands
get_top_commands() {
    # Read command history, extract commands, and count their occurrences
    cat "$HISTORY_FILE" | \
    cut -d ' ' -f1 | \ # Extracting the command part (assuming commands are separated by spaces)
    sort | \
    uniq -c | \
    sort -rn | \
    head -n "$TOP_N"
}

# Main function
main() {
    echo "Top $TOP_N recommended commands based on your usage:"
    get_top_commands
}

main
