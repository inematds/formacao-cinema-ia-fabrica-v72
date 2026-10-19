E=${TMPDIR:-/tmp}/ensaio-fabrica/a5; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/makeshorts.git && git -C makeshorts checkout -q 52eb799
Q=makeshorts/.claude/skills/makeshorts/scripts
ffmpeg -v error -f lavfi -i "testsrc2=s=1080x1920:r=30:d=20" -f lavfi -i "sine=f=220:d=20" \
  -af loudnorm=I=-14:TP=-2:LRA=7 -ar 48000 -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest ensaio-916.mp4
python3 $Q/qa_short.py ensaio-916.mp4 --profile divulgacao > qa.txt; echo "saída: $?"
grep -E "^(✅|⚠️|❌)|RESULTADO" qa.txt
