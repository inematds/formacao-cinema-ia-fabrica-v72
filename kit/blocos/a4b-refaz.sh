E=${TMPDIR:-/tmp}/ensaio-fabrica/a4; cd "$E"
git clone -q https://github.com/inematds/refazvideo.git && cd refazvideo && git checkout -q e1f369e
cat VERSION
X=exemplos/decisions-jev
python3 ferramentas/validar_visual.py $X/roteiro-pt.json $X/pt-b01.json $X/pt-b02.json; echo "saída: $?"
