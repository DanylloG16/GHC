<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificados Recebidos</title>
    <link rel="stylesheet" href="css/styleGestor.css">
</head>
<body>
    <!-- Menu Lateral -->
    <div class="wrapper">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="certificadosRecebidos.jsp">Certificados Recebidos</a>
            <a href="envioCertificado.jsp">Enviar Certificado</a>
            <a href="index.jsp">Página Inicial</a>
        </div>
        
        <!-- Conteúdo Principal -->
        <div class="content">
            <h1 class="text-center">Certificados Recebidos</h1>
            
            <!-- Tabela de Certificados -->
            <div class="table-container">
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Número de Horas</th>
                            <th>URL do Certificado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Exibir os certificados recebidos a partir do modelo -->
                        <c:forEach var="certificado" items="${certificados}">
                            <tr>
                                <td>${certificado.id}</td>
                                <td>${certificado.nome}</td>
                                <td>${certificado.email}</td>
                                <td>${certificado.horas}</td>
                                <td><a href="${certificado.url}" target="_blank">Visualizar Certificado</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
