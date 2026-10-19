E=${TMPDIR:-/tmp}/ensaio-fabrica/a2; cd "$E/explicavideos"
sed 's/"max_chars": 300/"max_chars": 140/' "$E/ensaio.json" > "$E/curto.json"
sed -i 's#"output": "[^"]*"#"output": "'"$E"'/saida-curta"#' "$E/curto.json"
python3 explica.py --config "$E/curto.json" prepare 2>&1 | grep -E "^ValueError"; echo "saída: ${PIPESTATUS[0]}"
