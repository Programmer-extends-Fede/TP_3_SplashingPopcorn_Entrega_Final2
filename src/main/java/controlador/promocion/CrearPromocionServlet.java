package controlador.promocion;

import java.io.IOException;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servicios.ServicioPromocion;

@WebServlet("/crearPromocion.ad")
public class CrearPromocionServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = -6648217727244375105L;
	private ServicioPromocion servicioPromocion;

	public void init() throws ServletException {
		super.init();
		this.servicioPromocion = new ServicioPromocion();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//pasa lo mismo que con editar, hay que traer las pelis por los id
		
		String titulo = request.getParameter("titulo");
		int pelicula1 = Integer.parseInt(request.getParameter("id"));
		int pelicula2 = Integer.parseInt(request.getParameter("id"));
		int pelicula3 = Integer.parseInt(request.getParameter("id"));
		String urlPortada = request.getParameter("urlPortada");
		
		
	}

}
