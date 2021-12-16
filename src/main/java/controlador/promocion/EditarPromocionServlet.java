package controlador.promocion;

import java.io.IOException;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servicios.ServicioPromocion;

@WebServlet("/editarPromocion.do")
public class EditarPromocionServlet extends HttpServlet implements Servlet{

	private static final long serialVersionUID = 4518186313984691446L;
	private ServicioPromocion servicioPromocion;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
