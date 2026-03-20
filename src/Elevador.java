public class Elevador {
    private final int andarMinimo;
    private final int andarMaximo;
    private int andarAtual;
    private boolean portaAberta;

    public Elevador(int andarMinimo, int andarMaximo) {
        if (andarMaximo <= andarMinimo) {
            throw new IllegalArgumentException("O andar maximo deve ser maior que o andar minimo.");
        }

        this.andarMinimo = andarMinimo;
        this.andarMaximo = andarMaximo;
        this.andarAtual = andarMinimo;
        this.portaAberta = false;
    }

    public boolean subir() {
        if (portaAberta || andarAtual >= andarMaximo) {
            return false;
        }

        andarAtual++;
        return true;
    }

    public boolean descer() {
        if (portaAberta || andarAtual <= andarMinimo) {
            return false;
        }

        andarAtual--;
        return true;
    }

    public boolean abrirPorta() {
        if (portaAberta) {
            return false;
        }

        portaAberta = true;
        return true;
    }

    public boolean fecharPorta() {
        if (!portaAberta) {
            return false;
        }

        portaAberta = false;
        return true;
    }

    public boolean isPortaAberta() {
        return portaAberta;
    }

    public int getAndarAtual() {
        return andarAtual;
    }

    public int getAndarMinimo() {
        return andarMinimo;
    }

    public int getAndarMaximo() {
        return andarMaximo;
    }

    public String getStatusPorta() {
        return portaAberta ? "aberta" : "fechada";
    }
}
