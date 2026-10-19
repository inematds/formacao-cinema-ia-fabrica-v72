#!/usr/bin/env bash
# portao-avatar.sh — porta de entrada de qualquer geração de avatar: sem termo conferido, nada segue.
# Uso: bash portao-avatar.sh <termo.md> <roteiro.txt>
# Não chama estúdio nenhum: só decide se você PODE abrir o estúdio, e quantos minutos vai pedir.
K=$(cd "$(dirname "$0")" && pwd)
termo="${1:?uso: portao-avatar.sh <termo.md> <roteiro.txt>}"; roteiro="${2:?falta o roteiro}"
python3 "$K/conferir-consentimento.py" "$termo" || { echo "PORTÃO FECHADO: corrija o termo antes de gerar"; exit 1; }
p=$(wc -w < "$roteiro")
echo "roteiro: $p palavras ≈ $(( (p * 60 + 139) / 140 )) s a 140 palavras/min"
echo "PORTÃO ABERTO: pode levar ao estúdio (a geração gasta crédito: confira o plano antes)"
