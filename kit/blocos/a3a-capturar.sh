K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
command -v agent-browser > /dev/null || { echo "FALTA agent-browser: npm i -g agent-browser@0.6.0 && agent-browser install"; exit 1; }
E=${TMPDIR:-/tmp}/ensaio-fabrica/a3; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/video-demonstrativo.git && git -C video-demonstrativo checkout -q a87b382
cp video-demonstrativo/skills/video-demonstrativo/scripts/capture.mjs "$K/exemplos/a3-demo/actions.json" .
python3 -m http.server 18791 --bind 127.0.0.1 --directory "$K/exemplos/a3-demo" > servidor.log 2>&1 & S=$!
until curl -s -o /dev/null http://127.0.0.1:18791/; do sleep 0.3; done
export AGENT_BROWSER_SESSION=ensaio-fabrica
node capture.mjs actions.json > captura.log 2>&1; echo "captura: $?"
agent-browser close > /dev/null 2>&1; kill $S
ls assets/shots
python3 -c "import json; s=json.load(open('steps.json')); print('passos no steps.json:', len(s['steps']))"
