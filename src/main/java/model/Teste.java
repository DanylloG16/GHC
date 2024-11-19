package model;
public class Teste {
    public static void main(String[] args) {
        // Criar e salvar o primeiro certificado
        Certificado certificado1 = new Certificado();
        certificado1.setNome("danyllo");
        certificado1.setMatricula("12345");
        certificado1.setArquivoUrl("https://example.com/certificado1.pdf");
        certificado1.setComentario("Primeiro certificado.");
        certificado1.salvar();

        // Criar e salvar o segundo certificado
        Certificado certificado2 = new Certificado();
        certificado2.setNome("Maria");
        certificado2.setMatricula("67890");
        certificado2.setArquivoUrl("https://example.com/certificado2.pdf");
        certificado2.setComentario("Segundo certificado.");
        certificado2.salvar();
    }
}
