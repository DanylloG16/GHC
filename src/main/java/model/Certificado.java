package model;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Certificado {
    private String nome;
    private String matricula;
    private String arquivoUrl;
    private String comentario;

    // Getters e setters
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getMatricula() { return matricula; }
    public void setMatricula(String matricula) { this.matricula = matricula; }
    public String getArquivoUrl() { return arquivoUrl; }
    public void setArquivoUrl(String arquivoUrl) { this.arquivoUrl = arquivoUrl; }
    public String getComentario() { return comentario; }
    public void setComentario(String comentario) { this.comentario = comentario; }

    // Método para salvar o certificado no banco de dados
    public void salvar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Conexão com o banco de dados
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/horascomplementares", "root", "12345");

            // Comando SQL para inserir os dados na tabela
            String sql = "INSERT INTO envios (nome, matricula, arquivo_url, comentario) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            
            // Definindo os parâmetros para a query
            stmt.setString(1, this.nome);
            stmt.setString(2, this.matricula);
            stmt.setString(3, this.arquivoUrl);
            stmt.setString(4, this.comentario);

            // Executando o comando de inserção
            stmt.executeUpdate();
        } catch (SQLException e) {
            // Em caso de erro, exibe a stack trace para facilitar o diagnóstico
            e.printStackTrace();
        } finally {
            // Garantir que os recursos sejam fechados
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para buscar todos os certificados do banco de dados
    public static List<Certificado> buscarTodos() {
        List<Certificado> certificados = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Conexão com o banco de dados
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/horascomplementares", "root", "12345");

            // Consulta SQL para obter todos os certificados
            String sql = "SELECT nome, matricula, arquivo_url, comentario FROM envios";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            // Processar os resultados
            while (rs.next()) {
                Certificado certificado = new Certificado();
                certificado.setNome(rs.getString("nome"));
                certificado.setMatricula(rs.getString("matricula"));
                certificado.setArquivoUrl(rs.getString("arquivo_url"));
                certificado.setComentario(rs.getString("comentario"));
                certificados.add(certificado);
            }
        } catch (SQLException e) {
            // Em caso de erro, exibe a stack trace
            e.printStackTrace();
        } finally {
            // Garantir que os recursos sejam fechados
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return certificados;
    }
}
