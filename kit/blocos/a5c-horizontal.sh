cd ${TMPDIR:-/tmp}/ensaio-fabrica/a5; Q=makeshorts/.claude/skills/makeshorts/scripts
ffmpeg -v error -y -f lavfi -i "testsrc2=s=1920x1080:r=30:d=20" -f lavfi -i "sine=f=220:d=20" \
  -af loudnorm=I=-14:TP=-2:LRA=7 -ar 48000 -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest ensaio-169.mp4
python3 $Q/qa_short.py ensaio-169.mp4 --profile divulgacao > qa169.txt; echo "saída: $?"
grep -E "^❌|RESULTADO" qa169.txt
