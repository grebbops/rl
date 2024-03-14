#!/usr/bin/env bash

# Function to handle user input
# Parameters:
#   $1: Prompt message
#   $2: Variable name to store the input
#   $3: (Optional) Whether the input is required (default is false)
prompt_input() {
  # Display a message along with the prompt
  echo -n "$1"
  if [[ "$3" == "required" ]]; then
    echo -n " (Required)"
  fi
  echo " (Press 'Esc' to exit, Enter to skip): "

  # Read user input
  read -re input

  # Check if the user pressed "Esc" (ASCII code 27)
  if [[ $? -eq 0 && $input == $'\e' ]]; then
    echo "You pressed 'Esc'. Exiting."
    exit 1
  fi

  # If input is required, check if it's empty
  if [[ "$3" == "required" && -z "$input" ]]; then
    echo "Input is required. Exiting."
    exit 1
  fi

  # Set a variable with the user input
  eval "$2=\"$input\""
}

# Examples

# Prompt for the first input (not required)
# prompt_input "Please enter something" input1

# Prompt for the second input (required)
# prompt_input "Please enter something else" input2 required
