#!/usr/bin/env python3
"""conferir-consentimento.py — confere o termo de uso de avatar e voz ANTES de qualquer geração.

Uso:  python3 conferir-consentimento.py <termo.md>
Saída: "OK: termo de <Pessoa> · 7 campos · válido até DD/MM/AAAA" (código 0)
       ou "FALTA: ..." / "VENCIDO: ..." com o que não bateu (código 1).

O termo é texto simples, uma linha por campo, no formato "Campo: texto".
Campos obrigatórios (os rótulos podem vir em PT, EN ou ES):
  Pessoa      quem aparece e fala (o avatar é dessa pessoa, e de mais ninguém)
  Autoriza    o que a pessoa autoriza (avatar, voz, os dois)
  Uso         onde e para quê (canais, cursos, anúncios…)
  Idiomas     em que línguas a voz pode falar
  Validade    até quando (DD/MM/AAAA); termo vencido reprova
  Revogação   como a pessoa cancela e o que acontece com os vídeos
  Rótulo      o aviso visível de conteúdo gerado por IA que vai no vídeo (tem de citar "IA" ou "AI")
"""
import datetime
import re
import sys
import unicodedata

CAMPOS = {
    "Pessoa": ["pessoa", "person", "persona"],
    "Autoriza": ["autoriza", "authorizes"],
    "Uso": ["uso", "use", "usos"],
    "Idiomas": ["idiomas", "languages"],
    "Validade": ["validade", "valid until", "validez"],
    "Revogação": ["revogacao", "revocation", "revocacion"],
    "Rótulo": ["rotulo", "label", "etiqueta"],
}
MIN = 3  # letras ou dígitos mínimos depois dos dois-pontos


def sem_acento(s):
    return "".join(c for c in unicodedata.normalize("NFD", s) if unicodedata.category(c) != "Mn").lower().strip()


def main():
    if len(sys.argv) != 2:
        print(__doc__.strip())
        return 2
    try:
        texto = open(sys.argv[1], encoding="utf-8").read()
    except OSError:
        print(f"FALTA: não abri {sys.argv[1]}")
        return 1
    achados = {}
    for linha in texto.splitlines():
        if ":" not in linha:
            continue
        rot, valor = linha.split(":", 1)
        rot = sem_acento(rot.lstrip("-* "))
        for campo, nomes in CAMPOS.items():
            if rot in nomes and len(re.sub(r"[^0-9A-Za-zÀ-ÿ]", "", valor)) >= MIN:
                achados[campo] = valor.strip()
    faltam = [c for c in CAMPOS if c not in achados]
    if faltam:
        print("FALTA: " + ", ".join(faltam))
        return 1
    if not re.search(r"\b(IA|AI)\b", achados["Rótulo"]):
        print("FALTA: o Rótulo não cita IA (ou AI)")
        return 1
    m = re.search(r"(\d{2})/(\d{2})/(\d{4})", achados["Validade"])
    if not m:
        print("FALTA: Validade sem data DD/MM/AAAA")
        return 1
    fim = datetime.date(int(m[3]), int(m[2]), int(m[1]))
    if fim < datetime.date.today():
        print(f"VENCIDO: validade {m[0]}")
        return 1
    print(f"OK: termo de {achados['Pessoa']} · {len(CAMPOS)} campos · válido até {m[0]}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
