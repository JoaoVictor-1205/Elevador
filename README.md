# Atividade - Elevador em Java

Projeto desenvolvido para representar um elevador com regras basicas de funcionamento orientado a objetos.

## Requisitos atendidos

- Subir
- Descer
- Abrir a porta
- Fechar a porta
- Indicar se a porta esta aberta ou fechada
- Mostrar o andar atual

## Regras implementadas

- O elevador nao sobe acima do ultimo andar disponivel.
- O elevador nao desce abaixo do andar minimo.
- O elevador nao sobe nem desce com a porta aberta.

## Estrutura

- `src/Elevador.java`: classe principal com atributos e metodos do elevador.
- `src/Main.java`: classe de execucao com demonstracao de uso dos metodos.
- `docs/diagrama-uml-elevador.png`: diagrama de classe da UML em PNG.

## Como compilar

```powershell
javac -d out src\*.java
```

## Como executar

```powershell
java -cp out Main
```

## Diagrama UML

O diagrama esta disponivel em `docs/diagrama-uml-elevador.png`.
