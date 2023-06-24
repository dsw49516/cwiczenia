#!/bin/bash

show_date() {
    current_date=$(date +%Y-%m-%d)
    echo "Dzisiejsza data: $current_date"
}

case "$1" in
    --date)
        show_date
        ;;
    *)
        echo "Nieznana opcja."
        ;;
esac
