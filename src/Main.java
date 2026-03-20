public class Main {
    public static void main(String[] args) {
        Elevador elevador = new Elevador(0, 5);

        exibirEstado("Estado inicial", elevador);

        executarAcao("Abrir porta", elevador.abrirPorta(), elevador);
        executarAcao("Subir com a porta aberta", elevador.subir(), elevador);
        executarAcao("Fechar porta", elevador.fecharPorta(), elevador);
        executarAcao("Subir", elevador.subir(), elevador);
        executarAcao("Subir", elevador.subir(), elevador);
        executarAcao("Descer", elevador.descer(), elevador);
        executarAcao("Abrir porta", elevador.abrirPorta(), elevador);
        executarAcao("Descer com a porta aberta", elevador.descer(), elevador);
        executarAcao("Fechar porta", elevador.fecharPorta(), elevador);

        while (elevador.subir()) {
            exibirEstado("Subindo ate o ultimo andar", elevador);
        }

        executarAcao("Tentar subir acima do ultimo andar", elevador.subir(), elevador);
    }

    private static void executarAcao(String acao, boolean sucesso, Elevador elevador) {
        System.out.printf("%s: %s%n", acao, sucesso ? "sucesso" : "acao nao permitida");
        exibirEstado("Estado atual", elevador);
    }

    private static void exibirEstado(String titulo, Elevador elevador) {
        System.out.printf(
                "%s -> andar: %d | porta: %s%n",
                titulo,
                elevador.getAndarAtual(),
                elevador.getStatusPorta()
        );
    }
}
