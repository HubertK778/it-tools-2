#!/bin/bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    --date | -d)
      echo $(date +"%Y-%m-%d %H:%M:%S")
      exit 0
      ;;
    --logs | -l)
        LOG_DIR="./logs"
        
        mkdir -p "$LOG_DIR"
        numberOfIterations=100
        
        
        if [[ -n $2 && $2 -gt 0 ]]; then
            numberOfIterations=$2
        fi
        for ((i=1; i<=numberOfIterations; i++)); do
            fileName="${LOG_DIR}/log${i}.txt"
            
            {
                echo "File name: $(basename "$fileName")"
                echo "Script that created the file: $0"
                echo "Creation date: $(date +"%Y-%m-%d %H:%M:%S")"
            } > "$fileName"
        done

        exit 0
      ;;
    --init)
        repoUrl="git@github.com:HubertK778/it-tools-2.git"
        git clone "$repoUrl" "$targetDir"
        
        fullPath=$(realpath "$targetDir")
        
        export PATH="$fullPath:$PATH"
        
        exit 0
      ;;
    --help | -h)
      echo "Usage: $0 [OPTION]"
      echo "Options:"
      echo "  --date          Print the current date and time."
      echo "  --logs [N]     Create N log files in the 'logs' directory (default is 100)."
      echo "  --help          Display this help message."
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information."
      exit 1
      ;;
  esac
done