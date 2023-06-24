#!/bin/bash

show_date() {
    current_date=$(date +%Y-%m-%d)
    echo "Dzisiejsza data: $current_date"
}

create_logs() {
    local count=${1:-100}
    mkdir "logs"
    cd logs
    for ((i = 1; i <= count; i++)); do
        filename="log${i}_$(basename "$0")_$(date +%Y-%m-%d).txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
    cd ..
}

case "$1" in
    --date)
        show_date
        ;;
    --logs)
        create_logs
        ;;
    *)
        echo "Nieznana opcja."
        ;;
esac
