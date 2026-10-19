K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
E=${TMPDIR:-/tmp}/ensaio-fabrica/a2; cd "$E/explicavideos"
cat > "$E/ensaio.json" <<FIM
{"id": "ensaio", "title": "Ensaio", "source_repo": "$E", "output": "$E/saida",
 "languages": ["pt"], "scene_files": {"pt": "$K/exemplos/a2-explica/cenas-pt.json"},
 "max_chars": 300}
FIM
python3 explica.py --config "$E/ensaio.json" prepare; echo "saída: $?"
ls "$E/saida/blocos" "$E/saida/templates/pt"
python3 explica.py --config "$E/ensaio.json" status | head -3
