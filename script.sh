#!/bin/bash

show_date() {
    current_date=$(date +%Y-%m-%d)
    echo "Dzisiejsza data: $current_date"
}

show_help() {
    echo "Dostępne opcje:"
    echo "  --date, -d               Wyświetla dzisiejszą datę"
    echo "  --logs, -l               Tworzy 100 plików logx.txt, zawierających nazwę pliku, nazwę skryptu i datę"
    echo "  --logs <n>, -l <n>       Tworzy <n> liczbę plików logx.txt, zawierających nazwę pliku, nazwę skryptu i datę"
    echo "  --init                   Klonuje całe repozytorium i ustawia ścieżkę w zmiennej PATH."
    echo "  --help, -h               Wyświetla tę wiadomość"
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

clone_repo_and_set_path() {
    local repo_url="<adres_repozytorium>"
    local repo_dir="repo"
    local repo_name="<nazwa_repozytorium>"

    git clone "$repo_url" "$repo_dir"

    echo "export PATH=\"\$PATH:$(pwd)/$repo_dir\"" >> ~/.bashrc
    source ~/.bashrc

    echo "Repozytorium \"$repo_name\" zostało sklonowane i ścieżka została dodana do zmiennej PATH."
}

case "$1" in
    --date)
        show_date
        ;;
    -d)
        show_date
        ;;
    --logs)
        create_logs "$2"
        ;;
    -l)
        create_logs "$2"
        ;;
    --init)
        clone_repo_and_set_path
        ;;
    --help)
        show_help
        ;;
    -h)
        show_help
        ;;
    *)
        echo "Nieznana opcja. Użyj --help w formacie "./script.sh --help", aby wyświetlić dostępne opcje."
        ;;
esac
