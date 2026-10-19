export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-fabrica/a3; S=$E/video-demonstrativo/skills/video-demonstrativo
cd "$E" && rm -rf demo
npx -y hyperframes@0.8.176 init demo --non-interactive > init.log 2>&1; echo "init: $?"
cd demo && mkdir -p assets/audio assets/txt
cp -r ../assets/shots assets/ && cp -r "$S/assets/fonts" assets/ && cp ../steps.json .
cp "$S/scripts/composition-template.mjs" build-demo.mjs
node -e 'const d=require("./steps.json"); const l=d.steps.map(s=>s.narration); l.push(d.ctaNarration);
l.forEach((t,i)=>require("fs").writeFileSync(`assets/txt/s${i+1}.txt`, t.trim()+"\n")); console.log("falas:", l.length)'
for f in assets/txt/s*.txt; do
  n=$(basename "$f" .txt)
  npx -y hyperframes@0.8.176 tts "$f" --voice pf_dora --lang pt-br --speed 0.98 --output "assets/audio/$n.wav" > /dev/null 2>&1 || echo "falhou $n"
done
ls assets/audio | wc -l
node build-demo.mjs | head -1
