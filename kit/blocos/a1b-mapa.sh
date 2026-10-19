K=~/projetos/formacao-cinema-ia-fabrica-v72/kit
python3 "$K/qual-motor.py" --lista | tail -3
python3 "$K/qual-motor.py" tema short; echo "saída: $?"
python3 "$K/qual-motor.py" tema podcast; echo "saída: $?"
