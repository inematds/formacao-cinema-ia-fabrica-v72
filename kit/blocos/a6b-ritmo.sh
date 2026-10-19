K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
cd ${TMPDIR:-/tmp}/ensaio-fabrica/a6; L=skill/forja-reel/assets/motor-scripts/lint-timeline.py
python3 $L "$K/exemplos/a6-ritmo/ritmo-ok.html" | grep -E "^Duração|ERROR"; echo "saída: ${PIPESTATUS[0]}"
python3 $L "$K/exemplos/a6-ritmo/ritmo-buraco.html" | grep -E "^Duração|ERROR"; echo "saída: ${PIPESTATUS[0]}"
