E=${TMPDIR:-/tmp}/ensaio-fabrica/a8; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/yt-pubx.git && git -C yt-pubx checkout -q f9842a1
export YTPUBX_CONFIG="$E/config" YTPUBX_DATA="$E/dados"
ffmpeg -v error -f lavfi -i color=c=0x0c0c10:s=1280x720:d=5 -f lavfi -i anullsrc=r=48000:cl=stereo -t 5 -shortest -c:v libx264 -pix_fmt yuv420p -c:a aac ensaio.mp4
./yt-pubx/yt-pubx init > /dev/null; echo "init: $?"
./yt-pubx/yt-pubx publicar ensaio.mp4 --dry-run --sem-thumb \
  --title "Ensaio da fábrica" --description "Vídeo de ensaio, 5 s, sem envio." --tags "ensaio,fabrica" 2>&1 \
  | grep -E "^(TÍTULO|TAGS|THUMB)|nada foi enviado" | sed "s/^\[yt-pubx [0-9:]*\] //"; echo "saída: ${PIPESTATUS[0]}"
