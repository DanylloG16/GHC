package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Certificado;

// Define a URL para acessar o controlador
@WebServlet("/envio-certificados")
public class EnvioCertificadoController extends HttpServlet {

    // Método para processar requisições GET (listar certificados)
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Buscar todos os certificados do banco de dados
        List<Certificado> certificados = Certificado.buscarTodos();

        // Adicionar a lista de certificados como atributo da requisição
        request.setAttribute("certificados", certificados);

        // Encaminhar para a página JSP que exibirá os certificados
        request.getRequestDispatcher("certificadosRecebidos.jsp").forward(request, response);
    }

    // Método para processar requisições POST (salvar novo certificado)
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Capturar os dados enviados pelo formulário
        String nome = request.getParameter("nome");
        String matricula = request.getParameter("matricula");
        String arquivoUrl = request.getParameter("arquivoUrl");
        String comentario = request.getParameter("comentario");

        // Criar um novo objeto Certificado e definir os valores
        Certificado certificado = new Certificado();
        certificado.setNome(nome);
        certificado.setMatricula(matricula);
        certificado.setArquivoUrl(arquivoUrl);
        certificado.setComentario(comentario);

        // Salvar o certificado no banco de dados
        certificado.salvar();

        // Redirecionar de volta para a página de listagem após salvar
        response.sendRedirect("certificados");
    }
}
