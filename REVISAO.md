# Revisão independente — A fábrica de vídeo com agentes (19/10/2026)

Revisor: subagente que não escreveu o curso, só leitura, com BRIEF, CURRICULO, AUDITORIA e PESQUISA da formação. Fatos conferidos com `git show` nos commits fixos dos motores.

## 1ª leitura — NOTA: 7/10

Graves:
1. Aula 4 citava o motor "local" do docflow, que não existe no código (f1ed75e só tem flow, agnes, reais, historia).
2. Aula 2 ensinava o explicavideos v1 e apresentava recursos do v2 (perfis, vídeo de exemplo) como se fossem do mesmo fluxo.
3. Aula 4 tratava `voz: nei` (voz clonada do Nei) como "uma linha para trocar", sem aviso; o E3 herdava a voz.
4. Aula 4 apresentava como neutro reaproveitar prints alheios sem crédito.

Menores: E3 com `/tmp` fixo; aula 8 E3 sem `echo saída`; PyYAML/Pillow faltando nos pré-requisitos; "max_chars padrão"; limite de rótulos sem fonte; estúdio amarrado ao ambiente do dono; Codex do publicar; alternativa sem avatar; nome do 33viralhooks; tempo de render sem captura.

## Correções (commit feaa8f0)
Todos os graves e menores corrigidos; desvio da aula 2 (prática no v1, v2 descrito) anotado no PLANO.

## 2ª leitura — NOTA: 8,5/10
Nenhum grave restante. Sugestão opcional aplicada depois: o "pronto quando" do E3 da aula 4 confere também que a voz foi trocada (`voz própria`).
