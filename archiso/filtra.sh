#!/bin/bash

# File paths (you can customize these)
installed_apps="packages.txt"
ignore_list="packages.x86_64"
output_file="a_incluir.txt"

# Ensure output file is empty before starting
> "$output_file"

# Loop through each app in the installed list
while IFS= read -r app; do
  # Skip empty lines
  [[ -z "$app" ]] && continue

  # Check if the app exists in the ignore list
  if ! grep -Fxq "$app" "$ignore_list"; then
    echo "$app" >> "$output_file"
  fi
done < "$installed_apps"

