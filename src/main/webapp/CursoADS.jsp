<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes do Curso</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styleCursoDetalhes.css">
</head>
<body>
    <!-- Barra superior verde -->
    <div class="bg-success text-light p-2 d-flex justify-content-between align-items-center">
        <button class="btn btn-outline-light" id="menu-btn">
            <img src="img/menu.png" alt="�cone de Menu" class="menu-icon">
        </button>
        <h5 class="m-0" id="curso-titulo">An�lise e Desenvolvimento de Sistemas</h5>
        <button class="btn btn-outline-light" id="notification-btn">
            <img src="img/notifica��o.png" alt="�cone de Notifica��o" class="notification-icon">
        </button>
    </div>

    <div class="d-flex">
        <!-- Menu lateral -->
        <nav id="sidebar" class="navbar-light vh-100 flex-column">
            <div class="input-group mb-3 px-3">
                <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar">
                <button class="btn btn-outline-dark" type="button">Go</button>
            </div>
            <ul class="nav flex-column px-3">
                <li class="nav-item mb-2">
                    <a class="nav-link text-dark d-flex align-items-center" href="PaginaInicial.html">
                        <img src="img/home.png" alt="Home Icon" class="sidebar-icon">
                        <span>Home</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-dark d-flex align-items-center" href="PaginaCursos.html">
                        <img src="img/cursos.png" alt="Cursos Icon" class="sidebar-icon">
                        <span>Cursos</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Conte�do principal -->
    <div id="main-container" class="container-fluid">
        <!-- Introdu��o -->
        <section class="intro-section p-4">
            <h2>Bem-vindo ao Curso de An�lise e Desenvolvimento de Sistemas</h2>
            <p>No curso de An�lise e Desenvolvimento de Sistemas, as horas complementares proporcionam experi�ncias fora da sala de aula. S�o necess�rias 340 horas, distribu�das em diferentes categorias. Confira os detalhes abaixo:</p>
        </section>

        <div class="divider"></div>

        <!-- Bot�es de categorias -->
        <section class="buttons-section text-center my-4">
            <button class="btn btn-primary mx-2" onclick="showCategory('ensino')">Atividades de Ensino</button>
            <button class="btn btn-primary mx-2" onclick="showCategory('pesquisa')">Atividades de Pesquisa</button>
            <button class="btn btn-primary mx-2" onclick="showCategory('extensao')">Atividades de Extens�o</button>
            <button class="btn btn-primary mx-2" onclick="showCategory('arte')">Esporte, Arte e Cultura</button>
            <button class="btn btn-primary mx-2" onclick="showCategory('cidadania')">Cidadania e Sustentabilidade</button>
        </section>

        <!-- Conte�do din�mico -->
        <section id="category-content" class="content-section p-4">
            <h4 class="text-center text-secondary">Selecione uma categoria para ver mais detalhes</h4>
        </section>

        <!-- Formul�rio -->
        <section class="upload-section mt-4 p-4">
            <h4 class="text-primary text-center mb-4">Envie um Arquivo</h4>
            <form id="upload-form" class="p-4 border rounded shadow bg-light" action="envio-certificado" method="POST" enctype="multipart/form-data">
                <!-- Campo Nome -->
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome" required>
                </div>

                <!-- Campo Matr�cula -->
                <div class="mb-3">
                    <label for="matricula" class="form-label">Matr�cula:</label>
                    <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Digite sua matr�cula" required>
                </div>

                <!-- Campo Arquivo -->
                <div class="mb-3">
                    <label for="fileUpload" class="form-label">Selecione o arquivo:</label>
                    <input type="file" class="form-control" id="fileUpload" name="fileUpload" required>
                </div>

                <!-- Campo Coment�rio -->
                <div class="mb-3">
                    <label for="comentario" class="form-label">Coment�rio:</label>
                    <textarea class="form-control" id="comentario" name="comentario" rows="3" placeholder="Escreva um coment�rio sobre o arquivo enviado..." required></textarea>
                </div>

                <!-- Bot�o Enviar -->
                <div class="text-center">
                    <button type="submit" class="btn btn-success btn-lg w-50">Enviar</button>
                </div>
            </form>
        </section>
    </div>

    <script>
        // L�gica do menu lateral
        const menuButton = document.getElementById('menu-btn');
        const sidebar = document.getElementById('sidebar');
        const mainContainer = document.getElementById('main-container');

        menuButton.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            mainContainer.classList.toggle('active');
        });

        // L�gica do conte�do din�mico
        const categoryContent = document.getElementById('category-content');

        const categories = {
            ensino: `
                <h4>Atividades de Ensino</h4>
                <p><strong>M�ximo:</strong> 90 horas</p>
                <p><strong>Documenta��o:</strong> Certificados de participa��o em atividades de ensino, como palestras, cursos extracurriculares e workshops.</p>
            `,
            pesquisa: `
                <h4>Atividades de Pesquisa</h4>
                <p><strong>M�ximo:</strong> 20 horas</p>
                <p><strong>Documenta��o:</strong> Comprova��o de participa��o em projetos de pesquisa ou desenvolvimento de trabalhos cient�ficos.</p>
            `,
            extensao: `
                <h4>Atividades de Extens�o</h4>
                <p><strong>M�ximo:</strong> 10 horas</p>
                <p><strong>Documenta��o:</strong> Registros de envolvimento em atividades de extens�o universit�ria, como est�gios, eventos ou iniciativas comunit�rias.</p>
            `,
            arte: `
                <h4>Esporte, Arte e Cultura</h4>
                <p><strong>M�ximo:</strong> 20 horas</p>
                <p><strong>Documenta��o:</strong> Certificados de participa��o em eventos culturais, esportivos ou art�sticos promovidos pela institui��o ou fora dela.</p>
            `,
            cidadania: `
                <h4>Cidadania e Sustentabilidade</h4>
                <p><strong>M�ximo:</strong> 100 horas</p>
                <p><strong>Documenta��o:</strong> Comprovantes de participa��o em projetos voltados para a cidadania, sustentabilidade ambiental ou atividades empreendedoras.</p>
            `
        };

        function showCategory(category) {
            categoryContent.innerHTML = categories[category];
        }
    </script>
</body>
</html>
