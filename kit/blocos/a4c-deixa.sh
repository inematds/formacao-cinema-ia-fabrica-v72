E=${TMPDIR:-/tmp}/ensaio-fabrica/a4; cd "$E/refazvideo"; X=exemplos/decisions-jev
sed '0,/"at": "Há poucas semanas"/s//"at": "Faz poucas semanas"/' $X/pt-b01.json > "$E/pt-b01-errado.json"
python3 ferramentas/validar_visual.py $X/roteiro-pt.json "$E/pt-b01-errado.json" $X/pt-b02.json; echo "saída: $?"
