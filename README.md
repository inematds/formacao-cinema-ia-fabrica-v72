# A fábrica de vídeo com agentes

Curso 4 de 6 da **Formação Cinema com IA** do INEMA.CLUB (conteúdo aberto e gratuito, formato INEMA Learning v7.2), em português, inglês e espanhol.

- Curso: https://inematds.github.io/formacao-cinema-ia-fabrica-v72/ (EN: `/en/`, ES: `/es/`)
- Público: quem já usa Claude Code ou Codex no terminal.
- Oito aulas: o mapa da fábrica, explicavideos, demonstração de app, docflow e refazvideo, shorts com portão de qualidade, editor de reels por agente, avatar e consentimento, publicação no YouTube em ensaio.

## Kit

`kit/` traz os blocos testados das aulas (`kit/blocos/*.sh`), as saídas capturadas em 19/10/2026 (`kit/saidas/`), os exemplos e quatro ferramentas: `qual-motor.py`, `conferir.py`, `conferir-consentimento.py` e `portao-avatar.sh`.

```bash
mkdir -p ~/projetos && cd ~/projetos
git clone https://github.com/inematds/formacao-cinema-ia-fabrica-v72.git
bash formacao-cinema-ia-fabrica-v72/kit/blocos/a1a-ambiente.sh
```

Cada bloco clona um motor público do INEMA num commit fixo e para antes de qualquer passo que gaste crédito ou publique: nenhum avatar, nenhum vídeo gerado por IA, nenhum envio.

## Gerar as páginas

Conteúdo em `conteudo/<lang>/`; `python3 gerar.py && python3 validar.py` (e `--lang en`, `--lang es`).
