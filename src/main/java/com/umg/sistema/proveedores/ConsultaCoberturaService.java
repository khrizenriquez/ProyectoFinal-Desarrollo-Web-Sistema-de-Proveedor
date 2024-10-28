package com.umg.sistema.proveedores;

import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/consulta")
public class ConsultaCoberturaService extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String codigoPacienteStr = request.getParameter("codigoPaciente");
        String fechaNacimiento = request.getParameter("fechaNacimiento");

        if (codigoPacienteStr == null || codigoPacienteStr.isEmpty() || fechaNacimiento == null || fechaNacimiento.isEmpty()) {
            request.setAttribute("resultado", "Error: Código del paciente y fecha de nacimiento son obligatorios.");
            request.getRequestDispatcher("/consulta.jsp").forward(request, response);
            return;
        }

        int codigoPaciente;
        try {
            codigoPaciente = Integer.parseInt(codigoPacienteStr);
        } catch (NumberFormatException e) {
            request.setAttribute("resultado", "Error: Código del paciente debe ser un número válido.");
            request.getRequestDispatcher("/consulta.jsp").forward(request, response);
            return;
        }

        Map<String, Object> consultaData = new HashMap<>();
        consultaData.put("codigoPaciente", codigoPaciente);
        consultaData.put("fechaNacimiento", fechaNacimiento);

        Gson gson = new Gson();
        String jsonInputString = gson.toJson(consultaData);

        String apiUrl = "http://localhost:5199/api/consulta/afiliado";
        HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json; utf-8");
        connection.setRequestProperty("Accept", "application/json");
        connection.setDoOutput(true);

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        String resultado;
        int statusCode = connection.getResponseCode();
        if (statusCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                resultado = br.readLine();
            }
        } else {
            resultado = "Sin Cobertura";
        }

        request.setAttribute("resultado", resultado);
        request.setAttribute("codigoPaciente", codigoPaciente);
        request.setAttribute("fechaNacimiento", fechaNacimiento);
        request.getRequestDispatcher("/consulta.jsp").forward(request, response);
    }
}
