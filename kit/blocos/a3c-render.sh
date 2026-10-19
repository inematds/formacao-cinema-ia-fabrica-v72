export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
cd ${TMPDIR:-/tmp}/ensaio-fabrica/a3/demo
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "◇|✗" | head -3
npx -y hyperframes@0.8.176 render --quality draft --workers 2 --quiet --output renders/demo.mp4 > render.log 2>&1
echo "render: $?"
D=$(grep -o 'id="root"[^>]*data-duration="[0-9.]*"' index.html | grep -o "[0-9.]*\"$" | tr -d \")
echo "duração pedida: $D s"
python3 "$K/conferir.py" renders/demo.mp4 "$D" 1920x1080 --audio; echo "saída: $?"
