E=${TMPDIR:-/tmp}/ensaio-fabrica/a6; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/videos-edit-cria.git && git -C videos-edit-cria checkout -q d9a5137
unzip -q videos-edit-cria/download/forja-reel.skill -d skill
ls skill/forja-reel/references skill/forja-reel/assets/motor-scripts
