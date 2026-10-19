cd ${TMPDIR:-/tmp}/ensaio-fabrica/a8
export YTPUBX_CONFIG="$PWD/config" YTPUBX_DATA="$PWD/dados"
ffmpeg -v error -y -f lavfi -i "testsrc2=s=1280x720" -frames:v 1 arte.png
./yt-pubx/yt-pubx publicar ensaio.mp4 --dry-run --title "Ensaio da fábrica" --description "Vídeo de ensaio, 5 s, sem envio." \
  --tags "ensaio,fabrica" --frase-thumb "A FÁBRICA" --cena-thumb "mesa de edição" --thumb-arte arte.png 2>&1 \
  | grep -E "^THUMB|nada foi enviado" | sed -E "s/^\[yt-pubx [0-9:]*\] //; s#/[0-9]{8}-[0-9]{6}-#/<data>-#"; echo "saída: ${PIPESTATUS[0]}"
f=$(ls dados/trabalhos/*/thumb.jpg | tail -1); python3 -c "from PIL import Image; print('thumb:', Image.open('$f').size)"
