#!/bin/bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    --date)
      echo $(date +"%Y-%m-%d %H:%M:%S")
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information."
      exit 1
      ;;
  esac
done