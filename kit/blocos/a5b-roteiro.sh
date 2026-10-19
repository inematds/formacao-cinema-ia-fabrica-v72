K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
cd ${TMPDIR:-/tmp}/ensaio-fabrica/a5; Q=makeshorts/.claude/skills/makeshorts/scripts
python3 $Q/qa_roteiro.py "$K/exemplos/a5-roteiros/bom.md" --keyword gancho > bom.txt; echo "bom: $?"
python3 $Q/qa_roteiro.py "$K/exemplos/a5-roteiros/fraco.md" --keyword gancho > fraco.txt; echo "fraco: $?"
grep -hE "❌|RESULTADO" bom.txt fraco.txt
