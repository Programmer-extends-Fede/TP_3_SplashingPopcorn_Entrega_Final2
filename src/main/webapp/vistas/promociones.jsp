<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Promociones</title>

<jsp:include page="../parciales/librerias.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="TP_3_SplashingPopcorn_Entrega_Final/css/index.css">
<link rel="stylesheet" type="text/css"
	href="TP_3_SplashingPopcorn_Entrega_Final/css/botones.css">
<link rel="stylesheet" type="text/css"
	href="TP_3_SplashingPopcorn_Entrega_Final/css/estiloPeliculas.css">

<script type="text/javascript"
	src="TP_3_SplashingPopcorn_Entrega_Final/js/js.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="TP_3_SplashingPopcorn_Entrega_Final/js/jquery.pajinate.js"></script>
<script type="text/javascript"
	src="TP_3_SplashingPopcorn_Entrega_Final/js/jquery.resize.js"></script>

</head>

<body>
	<header>
		<!-- ELEMENTO HEADER -->

		<jsp:include page="../parciales/header.jsp"></jsp:include>

	</header>

	<main>

		<!-- MODAL INICIO SESION -->
		<jsp:include page="../parciales/inicioSesionModal.jsp"></jsp:include>

		<!-- BARRA ADMIN -->

		<div id="barraTitulo">
			<div id="titulo">
				<h1>Promociones</h1>
			</div>

			<c:if test="${usuario.esAdmin()}">
				<div id="menuAdmin"
					class="nav nav-pills position-absolute top-0 end-0">
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#modalCrearPromocion"
						id="botonCrear">Crear nueva</button>
				</div>
			</c:if>

			<div id="fondoPrincipal" class="container-fluid">

				<div id="contenidoPrincipal">

					<!-- LISTADO DE GÉNEROS -->
					<div class="lista-generos">
						<a class="genero-item" data-type="todos" href="#"><c:out
								value="Todas"></c:out></a>
						<c:forEach items="${generos}" var="genero">

							<a class="genero-item" data-type="${genero.nombre}" href="#">
								<c:out value="${genero.nombre}"></c:out>
							</a>
						</c:forEach>
					</div>
					<section id="cardsPeliculas" class="row">
						<div id="contenedor-paginador">

							<!-- CARDS -->
							<c:forEach items="${promociones}" var="promocion">
								<div class="row contenido">
									<div class="col-6 col-md-4 col-lg-4 display-flex">
										<div class="card" data-type="${promocion.getGenero()}">
											<div class="card-body">
												<img src="${promocion.urlPortada}" class="d-block w-100"
													alt="007">
												<h5 class="card-title">
													<c:out value="${promocion.titulo}"></c:out>
												</h5>
												<p class="card-text">
													<c:out value="Duracion: ${promocion.getDuracion()}"></c:out>
												</p>
												<p class="card-text">
													<c:out value="Precio: ${promocion.getPrecio()}"></c:out>
												</p>
												<a href="detalle.jsp?id=${promocion.id}"
													class="btn btn-primary" id="botonDetalles">Ver</a>

												<c:if test="${usuario.esAdmin}">
													<a
														href="controlador/pelicula/editarPromocion?id=${promocion.id}"
														data-bs-toggle="modal"
														data-bs-target="#modalEditarPromocion"
														class="btn btn-success" id="botonEditar">Editar</a>

													<a
														href="controlador/pelicula/borrarPromocion?id=${promocion.id}"
														data-bs-toggle="modal" data-bs-target="#modalEliminar"
														class="btn btn-success" id="botonEliminar">Eliminar</a>
												</c:if>

											</div>
										</div>
									</div>
								</div>

							</c:forEach>


							<!-- PAGINADOR -->
							<div id="paginador" class="row">
								<div class="page_navigation"></div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<!-- MODAL CREAR PROMOCIÓN -->
		<div class="modal fade" id="modalCrearPromocion" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<div class="d-inline-flex">
							<img alt="" src="imagenes/logo.png"
								style="width: 30%; margin: -20px;">
							<h2 class="align-self-center">Crear promoción</h2>
						</div>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="controlador/crearPromocion" method="post">

							<label for="titulo">Titulo de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" required value="${promocion.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>

							<div class="form-floating mt-5 mb-3">
								<label for="peliculasEnPromos">Elija las películas:</label> <input
									list="listaPeliculas" id="peliculasEnPromos"
									name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="peliculas">
										<option value="${peliculas.titulo}">
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="peliculasEnPromos">Elija las películas:</label> <input
									list="listaPeliculas" id="peliculasEnPromos"
									name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="peliculas">
										<option value="${peliculas.titulo}">
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="peliculasEnPromos">Elija las películas:</label> <input
									list="listaPeliculas" id="peliculasEnPromos"
									name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="peliculas">
										<option value="${peliculas.titulo}">
									</c:forEach>
								</datalist>

							</div>

							<label for="descripcion">Descripción de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4"
									id="descripcion" name="descripcion" required
									value="${promocion.descripcion}">
								<div class="invalid-feedback">Introduzca la descripción
									por favor</div>
							</div>
							<div class="form-floating mb-3">
								<input type="image" class="form-control rounded-4"
									id="urlPortada" name="urlPortada" required
									value="${pelicula.urlPortada}"> <label for="urlPortada">Nombre
									de película</label>
								<div class="invalid-feedback">Introduzca la imagen por
									favor</div>
							</div>

							<button type="submit"
								class="w-100 mb-2 btn btn-lg rounded-4 btn-warning">Crear
								promoción</button>

						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL ELIMINAR -->
		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Eliminar
							promoción</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>¿Está seguro de eliminar esta promoción?</p>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary"
							href="controlador/promociones/borrarPromocion.do?id=${promocion.id}"
							role="button" id="aceptar-eliminar">Aceptar</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL EDITAR PROMOCIÓN -->
		<div class="modal fade" id="modalEditarPromocion" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<div class="d-inline-flex">
							<img alt="" src="imagenes/logo.png"
								style="width: 30%; margin: -20px;">
							<h2 class="align-self-center">Editar promoción</h2>
						</div>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="controlador/promociones/editarPromocion.do"
							method="post">
							<label for="titulo">Titulo de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" required value="${promocion.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>

							<div class="form-floating mt-5 mb-3">
								<label for="peliculasEnPromos">Elija las películas:</label> <input
									list="listaPeliculas" id="peliculasEnPromos"
									name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="peliculas">
										<option value="${peliculas.titulo}">
									</c:forEach>
								</datalist>

							</div>
							<label for="descripcion">Descripción de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4"
									id="descripcion" name="descripcion" required
									value="${promocion.descripcion}">
								<div class="invalid-feedback">Introduzca la descripción
									por favor</div>
							</div>


							<button type="submit"
								class="w-100 mb-2 btn btn-lg rounded-4 btn-warning">Guardar
								cambios</button>

						</form>
					</div>
				</div>
			</div>
		</div>


	</main>

	<footer class="m-1">
		<!-- ELEMENTO FOOTER -->
		<jsp:include page="../parciales/footer.jsp"></jsp:include>
	</footer>
</body>
</html>