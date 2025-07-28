#!/bin/bash

# File paths (you can customize these)
installed_apps="./pacotes-instalados.txt"
ignore_list="./kaosarch-iso-pacotes.txt"
output_file="a_incluir_no_iso.txt"

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

