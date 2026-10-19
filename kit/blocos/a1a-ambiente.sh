for c in git python3 node ffmpeg; do printf "%-8s" "$c"; command -v $c > /dev/null && echo ok || echo FALTA; done
node --version; ffmpeg -version | head -1 | cut -d' ' -f1-3; python3 --version
