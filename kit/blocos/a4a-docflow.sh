E=${TMPDIR:-/tmp}/ensaio-fabrica/a4; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/docflow.git && cd docflow && git checkout -q f1ed75e
./docflow --version
./docflow estilos | head -4
grep -E "^(slug|estilo|duracao_total|duracao_cena|formato|motor|voz):" temas/egito.yaml
