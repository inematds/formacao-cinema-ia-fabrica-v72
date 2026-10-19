cd ${TMPDIR:-/tmp}/ensaio-fabrica/a5
git clone -q https://github.com/inematds/cardshorts.git && git -C cardshorts checkout -q d7f5c6d
cd cardshorts && python3 cardshorts.py estilos | grep -E "^[a-z]" 
grep -E "^(estilo|max_seg):" exemplos/versus/roteiro.yaml
