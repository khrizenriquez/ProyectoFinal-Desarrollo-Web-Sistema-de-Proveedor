<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Desarrollo Web :: Consulta de Cobertura de Afiliado</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css" />
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <section class="section">
        <div class="container">
            <h2 class="has-text-centered">Cobertura de Afiliado</h2>

            <form action="consulta" method="post" class="box">
                <div class="field">
                    <label class="label" for="nitProveedor">NIT del Proveedor:</label>
                    <div class="control">
                        <input class="input" type="text" id="nitProveedor" name="nitProveedor" placeholder="Ingresa el NIT del proveedor" required>
                    </div>
                </div>

                <div class="field">
                    <label class="label" for="codigoPaciente">Código del Paciente:</label>
                    <div class="control">
                        <input class="input" type="number" id="codigoPaciente" name="codigoPaciente" placeholder="Ingresa el código del paciente" required>
                    </div>
                </div>

                <div class="field">
                    <label class="label" for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <div class="control">
                        <input class="input" type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                    </div>
                </div>

                <div class="field">
                    <label class="label" for="fechaCobertura">Fecha de Cobertura:</label>
                    <div class="control">
                        <input class="input" type="date" id="fechaCobertura" name="fechaCobertura" required>
                    </div>
                </div>

                <div class="field is-grouped is-grouped-centered">
                    <div class="control">
                        <button type="submit" class="button is-primary">Consultar</button>
                    </div>
                </div>
            </form>

            <% String resultado = (String) request.getAttribute("resultado"); %>
            <div class="notification is-info is-light" style="<%= resultado != null ? "display: block;" : "display: none;" %>">
                <h3 class="title is-5">Resultado:</h3>
                <p><%= resultado != null ? resultado : "" %></p>
            </div>
        </div>
    </section>
</body>
</html>
