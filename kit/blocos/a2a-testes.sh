E=${TMPDIR:-/tmp}/ensaio-fabrica/a2; rm -rf "$E"; mkdir -p "$E"; cd "$E"
git clone -q https://github.com/inematds/explicavideos.git && cd explicavideos
git checkout -q 604fc74 && cat VERSION
python3 explica.py --help | grep -E "^  (prepare|preview)"
python3 -m unittest discover -s tests > testes.log 2>&1; echo "saída: $?"
grep -E "^(Ran|OK)" testes.log | sed 's/ in .*s$//'
