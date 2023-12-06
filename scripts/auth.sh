#!/bin/bash

# Check if CLIENT_ID is set
if [ -z "$CLIENT_ID" ]; then
  echo "Error: CLIENT_ID is not set. Please set it in the env file."
  exit 1
fi

# Set read-write access based on the READ_WRITE variable (default to false)
if [ "$READ_WRITE" == "true" ]; then
  ACCESS="--read-write"
else
  ACCESS=""
fi

# Run onedrive-fuse login command
onedrive-fuse login --client-id "$CLIENT_ID" $ACCESS

# Check if the login was successful
if [ $? -eq 0 ]; then
  echo "Login successful."
else
  echo "Login failed."
  exit 1
fi

