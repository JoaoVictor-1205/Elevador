import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Elevador elevador = new Elevador(0, 5);
        Scanner scanner = new Scanner(System.in);

        System.out.println("Controle do elevador");
        System.out.printf(
                "Andares disponiveis: %d a %d%n",
                elevador.getAndarMinimo(),
                elevador.getAndarMaximo()
        );
        exibirEstado("Estado inicial", elevador);

        while (true) {
            System.out.println();
            System.out.println("Comandos: subir, descer, abrir, fechar, status, sair");
            System.out.print("Digite um comando: ");

            String comando = scanner.nextLine().trim().toLowerCase();

            if (comando.equals("sair")) {
                System.out.println("Programa encerrado.");
                break;
            }

            switch (comando) {
                case "subir":
                    System.out.println(elevador.subir() ? "Elevador subiu um andar." : "Nao foi possivel subir.");
                    exibirEstado("Estado atual", elevador);
                    break;
                case "descer":
                    System.out.println(elevador.descer() ? "Elevador desceu um andar." : "Nao foi possivel descer.");
                    exibirEstado("Estado atual", elevador);
                    break;
                case "abrir":
                    System.out.println(elevador.abrirPorta() ? "Porta aberta." : "A porta ja esta aberta.");
                    exibirEstado("Estado atual", elevador);
                    break;
                case "fechar":
                    System.out.println(elevador.fecharPorta() ? "Porta fechada." : "A porta ja esta fechada.");
                    exibirEstado("Estado atual", elevador);
                    break;
                case "status":
                    exibirEstado("Estado atual", elevador);
                    break;
                default:
                    System.out.println("Comando invalido. Tente novamente.");
                    break;
            }
        }

        scanner.close();
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
