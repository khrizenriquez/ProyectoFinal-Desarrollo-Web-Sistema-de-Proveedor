<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Desarrollo Web :: Consulta de Afiliado</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <section class="section">
        <div class="container">
            <h2 class="has-text-centered">Consulta de Cobertura de Afiliado</h2>
            <form action="${pageContext.request.contextPath}/consulta" method="post">
                <div class="field">
                    <label class="label" for="codigoPaciente">Código del Paciente:</label>
                    <div class="control">
                        <input class="input" type="number" id="codigoPaciente" name="codigoPaciente" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label" for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <div class="control">
                        <input class="input" type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                    </div>
                </div>
                <div class="control">
                    <button class="button is-link" type="submit">Consultar</button>
                </div>
            </form>

            <% 
                String resultado = (String) request.getAttribute("resultado");
                Integer codigoPaciente = (Integer) request.getAttribute("codigoPaciente");
                String fechaNacimiento = (String) request.getAttribute("fechaNacimiento");

                if (resultado != null) {
            %>
                <div class="notification">
                    <h3 class="title is-5">El afiliado se encuentra:</h3>
                    <p>Código del Paciente: <%= codigoPaciente %></p>
                    <p>Fecha de Nacimiento: <%= fechaNacimiento %></p>
                    <p>Estado: <span class="notification-state"><%= resultado %></span></p>
                </div>
            <% 
                }
            %>
        </div>
    </section>
</body>
</html>
