<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Películas</title>

<jsp:include page="../parciales/librerias.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="/TP_3_SplashingPopcorn_Entrega_Final/css/index.css">
<link rel="stylesheet" type="text/css"
	href="/TP_3_SplashingPopcorn_Entrega_Final/css/botones.css">
<link rel="stylesheet" type="text/css"
	href="/TP_3_SplashingPopcorn_Entrega_Final/css/estiloPeliculas.css">

<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final/js/js.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final/js/jquery.pajinate.js"></script>
<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final/js/jquery.resize.js"></script>

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
				<h1>Películas</h1>
			</div>

			<c:if test="${usuario.esAdmin()}">
				<div id="menuAdmin"
					class="nav nav-pills position-absolute top-0 end-0">
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#modalCrearPelicula"
						id="botonCrear">Crear película</button>
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#modalCrearGenero"
						id="botonCrear">Crear género</button>

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
							<c:if test="${user.admin}">
								<button type="button" class="btn btn-danger rounded"
									data-bs-toggle="modal" data-bs-target="#modalEliminarGenero"
									id="botonCrear" value="${genero.nombre}">
									<i class="bi bi-x-circle-fill"></i>
								</button>
							</c:if>

						</c:forEach>

					</div>



					<section id="cardsPeliculas" class="row">
						<div id="contenedor-paginador">

							<!-- CARDS -->
							<c:forEach items="${peliculas}" var="pelicula">
								<div class="row contenido">
									<div class="col-6 col-md-4 col-lg-4 display-flex">
										<div class="card" data-type="${pelicula.genero}">
											<div class="card-body">
												<img src="${pelicula.urlPortada}" class="d-block w-100"
													alt="">
												<h5 class="card-title">
													<c:out value="${pelicula.titulo}"></c:out>
												</h5>
												<p class="card-text">
													<c:out value="Duración: ${pelicula.duracion}"></c:out>
												</p>
												<p class="card-text">
													<c:out value="Precio: ${pelicula.precio}"></c:out>
												</p>
												<a href="detalle.jsp?id=${pelicula.id}"
													class="btn btn-primary" id="botonDetalles">Ver</a>

												<c:if test="${usuario.esAdmin}">
													<a
														href="controlador/pelicula/editarPelicula?id=${pelicula.id}"
														data-bs-toggle="modal"
														data-bs-target="#modalEditarPelicula"
														class="btn btn-success" id="botonEditar">Editar</a>

													<a
														href="controlador/pelicula/borrarPelicula?id=${pelicula.id}"
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
		<!-- MODAL CREAR PELÍCULA -->
		<div class="modal fade" id="modalCrearPelicula" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<div class="d-inline-flex">
							<img alt="" src="imagenes/logo.png"
								style="width: 30%; margin: -20px;">
							<h2 class="align-self-center">Crear película</h2>
						</div>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="/crearPelicula" method="post">

							<label for="titulo">Titulo de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" required value="${pelicula.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>
							<label for="precio"
								class='col-form-label ${pelicula.errores.get("precio") != null ? "es-invalido" : "" }'>Precio</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4" id="precio"
									name="precio" required value="${pelicula.precio}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("precio")}'></c:out>
								</div>
							</div>
							<label for="duracion"
								class='col-form-label ${pelicula.errores.get("duracion") != null ? "es-invalido" : "" }'>Duración</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4"
									id="duracion" name="duracion" required
									value="${pelicula.duracion}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("duracion")}'></c:out>
								</div>
							</div>

							<label for="stock"
								class='col-form-label ${pelicula.errores.get("stock") != null ? "es-invalido" : "" }'>Stock
								disponible</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4" id="stock"
									name="stock" required value="${pelicula.stock}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("stock")}'></c:out>
								</div>
							</div>

							<label for="genero">Elija un género</label>
							<div class="form-floating mb-3">
								<select class="form-select" aria-label="Default select example">
									<c:forEach items="${generos}" var="genero">
										<option value="${genero.nombre}"></option>
									</c:forEach>
								</select>
							</div>
							<div class="form-floating mb-3">
								<input type="image" class="form-control rounded-4" id="urlFondo"
									name="urlFondo" required value="${pelicula.urlFondo}">
								<label for="urlFondo">Introduzca imagen</label>
								<div class="invalid-feedback">Introduzca la imagen por
									favor</div>
							</div>
							<div class="form-floating mb-3">
								<input type="image" class="form-control rounded-4"
									id="urlPortada" name="urlPortada" required
									value="${pelicula.urlPortada}"> <label for="urlPortada">Nombre
									de película</label>
								<div class="invalid-feedback">Introduzca la imagen por
									favor</div>
							</div>
							<label for="descripcion">Descripción de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4"
									id="descripcion" name="descripcion" required
									value="${pelicula.descripcion}">
								<div class="invalid-feedback">Introduzca la descripción
									por favor</div>
							</div>
							<label for="descripcion">Descripción de película</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4"
									id="anioLanzamiento" name="descripcion" required
									value="${pelicula.anioLanzamiento}">
								<div class="invalid-feedback">Introduzca el año por favor</div>
							</div>
							<label for="lema">Lema de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="lema"
									name="lema" required value="${pelicula.lema}">
								<div class="invalid-feedback">Introduzca el lema por favor</div>
							</div>


							<button type="submit"
								class="w-100 mb-2 btn btn-lg rounded-4 btn-warning">Crear
								película</button>

						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- MODAL CREAR GÉNERO -->
		<div class="modal fade" id="modalCrearGenero" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<div class="d-inline-flex">
							<img alt="" src="imagenes/logo.png"
								style="width: 30%; margin: -20px;">
							<h2 class="align-self-center">Crear género</h2>
						</div>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="/crearGenero" method="post">

							<label for="genero">Nuevo género</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="genero"
									name="genero" required value="${genero.nombre}">
								<div class="invalid-feedback">Introduzca el nombre del
									nuevo género por favor</div>
							</div>
							<button type="submit"
								class="w-100 mb-2 btn btn-lg rounded-4 btn-warning">Crear
								género</button>

						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL ELIMINAR GÉNERO -->
		<div class="modal fade" id="modalEliminarGenero"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Eliminar
							género</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>¿Está seguro de eliminar este género?</p>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary"
							href="controlador/peliculas/borrarGenero?nombre=${genero.nombre}"
							role="button" id="aceptar-eliminar">Aceptar</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>


		<!-- MODAL ELIMINAR PELICULA-->
		<!-- 	<div class="modal fade" id="modalEliminarPelicula"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Eliminar
							película</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>¿Está seguro de eliminar esta película?</p>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary"
							href="/peliculas/borrarPelicula?id=${pelicula.id}"
							role="button" id="aceptar-eliminar">Aceptar</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div> -->

		<!-- MODAL EDITAR PELÍCULA -->
		<div class="modal fade" id="modalEditarPelicula" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<div class="d-inline-flex">
							<img alt="" src="imagenes/logo.png"
								style="width: 30%; margin: -20px;">
							<h2 class="align-self-center">Editar película</h2>
						</div>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body p-5 pt-0">
						<form action="/editarPelicula" method="post">
							<label for="titulo">Titulo de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" placeholder="${pelicula.titulo}" required
									value="${pelicula.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>

							<label for="precio"
								class='col-form-label ${pelicula.errores.get("precio") != null ? "es-invalido" : "" }'>Precio</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4" id="precio"
									name="precio" placeholder="${pelicula.precio}" required
									value="${pelicula.precio}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("precio")}'></c:out>
								</div>
							</div>
							<label for="duracion"
								class='col-form-label ${pelicula.errores.get("duracion") != null ? "es-invalido" : "" }'>Duración</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4"
									id="duracion" name="duracion"
									placeholder="${pelicula.duracion}" required
									value="${pelicula.duracion}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("duracion")}'></c:out>
								</div>
							</div>


							<label for="stock"
								class='col-form-label ${pelicula.errores.get("stock") != null ? "es-invalido" : "" }'>Stock
								disponible</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4" id="stock"
									name="stock" placeholder="${pelicula.stock}" required
									value="${pelicula.stock}">
								<div class="invalid-feedback">
									<c:out value='${pelicula.errores.get("stock")}'></c:out>
								</div>
							</div>

							<label for="genero">Elija un género</label>
							<div class="form-floating mb-3">
								<select class="form-select" aria-label="Default select example">
									<c:forEach items="${generos}" var="genero">
										<option value="${genero.nombre}">"${genero.nombre}"</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-floating mb-3">
								<input type="image" class="form-control rounded-4" id="urlFondo"
									name="urlFondo" required value="${pelicula.urlFondo}">
								<label for="urlFondo">Introduzca imagen</label>
								<div class="invalid-feedback">Introduzca la imagen por
									favor</div>
							</div>
							<div class="form-floating mb-3">
								<input type="image" class="form-control rounded-4"
									id="urlPortada" name="urlPortada" required
									value="${pelicula.urlPortada}"> <label for="urlPortada">Nombre
									de película</label>
								<div class="invalid-feedback">Introduzca la imagen por
									favor</div>
							</div>

							<label for="descripcion">Descripción de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4"
									id="descripcion" name="descripcion"
									placeholder="${pelicula.descripcion}" required
									value="${pelicula.descripcion}">
								<div class="invalid-feedback">Introduzca la descripción
									por favor</div>
							</div>
							<label for="anioLanzamiento">Año de película</label>
							<div class="form-floating mb-3">
								<input type="number" class="form-control rounded-4"
									id="anioLanzamiento" name="descripcion"
									placeholder="${pelicula.anioLanzamiento}" required
									value="${pelicula.anioLanzamiento}">
								<div class="invalid-feedback">Introduzca el año por favor</div>
							</div>
							<label for="lema">Lema de película</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="lema"
									name="lema" placeholder="${pelicula.lema}" required
									value="${pelicula.lema}">
								<div class="invalid-feedback">Introduzca el lema por favor</div>
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