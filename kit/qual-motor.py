#!/usr/bin/env python3
"""qual-motor.py — o mapa da fábrica: do que você TEM e do que QUER ao motor do INEMA.

A tabela é a da área Vídeos do INEMA (eventos.inema.pro/videos/, seção "Por onde começar", lida em 19/10/2026).
A coluna "onde aprender" diz em que aula deste curso (ou em que curso irmão) o motor aparece.

Uso:  python3 qual-motor.py --lista              # a tabela inteira
      python3 qual-motor.py <tenho> <quero>      # ex.: python3 qual-motor.py tema short
Saída: "Use: MakeShorts ou cardshorts · aprender: aula 5" (código 0)
       ou "SEM MOTOR: ..." com as opções para o que você tem (código 1).
"""
import sys

# (tenho, quero, o que é, motor, onde aprender)
MAPA = [
    ("tema", "explicativo", "Vídeo explicativo com avatar, voz e ilustrações", "Explicavideos", "aula 2"),
    ("tema", "documentario", "Documentário narrado, já publicado no YouTube", "docflow", "aula 4"),
    ("video-ref", "versao", "A sua versão em português, com o seu avatar", "refazvideo", "aula 4"),
    ("link-pagina", "editavel", "Vídeo editável com voz em português", "Content2Video ou videoprodutor", "fora deste curso (guia da área Vídeos)"),
    ("link-app", "demo", "Demonstração narrada, clique a clique", "video-demonstrativo", "aula 3"),
    ("curso", "aulas", "Um vídeo por trilha ou por aula", "videos-cursos-inema", "fora deste curso (guia da área Vídeos)"),
    ("tema", "short", "Short ou reel 9:16 com gancho", "MakeShorts ou cardshorts", "aula 5"),
    ("link-reel", "comentario", "O seu reel comentando o original", "reelcomenta", "fora deste curso (guia da área Vídeos)"),
    ("video-longo", "corte", "Um corte curto que faz sentido", "otimizevideo", "fora deste curso (guia da área Vídeos)"),
    ("fotos", "filme", "Filme com câmera e transições, sem IA de vídeo", "Diretor de Animação ou PixFlow", "curso 2, aula 5"),
    ("site", "filme-marca", "O filme da marca", "filmarca", "curso 5"),
    ("foto-produto", "anuncio", "Anúncio em vídeo estilo UGC", "UGC Seedance 2.5 ou produtoshotad", "curso 2, aula 6"),
    ("frase", "clipe", "Música, capa e clipe", "musicavideo", "fora deste curso (guia da área Vídeos)"),
    ("video-pronto", "publicar", "Publicado no YouTube com título, descrição e capa", "yt-pubx", "aula 8"),
]


def main():
    args = sys.argv[1:]
    if args == ["--lista"]:
        for tenho, quero, oque, motor, onde in MAPA:
            print(f"{tenho:13} {quero:12} → {motor} ({onde})")
        print(f"{len(MAPA)} linhas")
        return 0
    if len(args) != 2:
        print(__doc__.strip())
        return 2
    tenho, quero = args
    for t, q, oque, motor, onde in MAPA:
        if (t, q) == (tenho, quero):
            print(f"{oque}")
            print(f"Use: {motor} · aprender: {onde}")
            return 0
    opcoes = [q for t, q, *_ in MAPA if t == tenho]
    if opcoes:
        print(f"SEM MOTOR: com '{tenho}' a tabela tem: {', '.join(opcoes)}")
    else:
        print(f"SEM MOTOR: '{tenho}' não está na tabela; rode --lista")
    return 1


if __name__ == "__main__":
    sys.exit(main())
