cd ${TMPDIR:-/tmp}/ensaio-fabrica/a8
export YTPUBX_CONFIG="$PWD/config" YTPUBX_DATA="$PWD/dados"
./yt-pubx/yt-pubx publicar ensaio.mp4 --dry-run --sem-thumb 2>&1 | grep "ERRO" | sed "s/^\[yt-pubx [0-9:]*\] //"; echo "saída: ${PIPESTATUS[0]}"
