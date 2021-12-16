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
	href="/TP_3_SplashingPopcorn_Entrega_Final2/css/index.css">
<link rel="stylesheet" type="text/css"
	href="/TP_3_SplashingPopcorn_Entrega_Final2/css/botones.css">
<link rel="stylesheet" type="text/css"
	href="/TP_3_SplashingPopcorn_Entrega_Final2/css/estiloPeliculas.css">

<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final2/js/filtrarGeneros.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final2/js/jquery.pajinate.js"></script>
<script type="text/javascript"
	src="/TP_3_SplashingPopcorn_Entrega_Final2/js/jquery.resize.js"></script>

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

					<!-- CONTENEDOR DE CARDS -->

					<div class="d-flex col-12 flex-column mt-0 mb-3"
						id="contenedor-cards">

						<!-- TABLA DE CARDS -->
						<div class="row justify-content-around contenido m-0 mb-4">
							<!-- CARD -->
							<c:forEach items="${promociones}" var="promocion">
								<div
									class="display-flex justify-content-center col-md-4 col-5 mt-5 px-md-4 px-sm-5 px-2">
									<div
										class="row flex-column fondo-backdrop carta mx-auto h-80 m-0"
										data-type="${promocion.getGenero()}"
										style="background-image: linear-gradient(90deg, rgba(22, 26, 29, 1) 30%, rgba(22, 26, 29, 1) 80%');">
										<!-- IMAGEN CARD -->

										<div class="fondo-portada mx-auto"
											style="background-image: url('${promocion.urlPortada}');">
										</div>

										<!-- DESCRIPCION CARD -->
										<div class="col d-flex p-0">
											<div class="row m-0 my-2 w-100" id="contenedorDescrip">
												<div class="d-flex">
													<p class="titulo-carta h3 mx-auto text-center text-white">
														<c:out value="${promocion.titulo}"></c:out>
														<br>
														<c:out value="Duración: ${promocion.getDuracion()} min"></c:out>
														<br>
														<c:out value="Precio: $ ${promocion.getPrecio()}"></c:out>
														<br>
													</p>
												</div>
												<div class="d-flex mt-auto justify-content-center">
													<a
														href="/TP_3_SplashingPopcorn_Entrega_Final2/listarDetallePromocion?id=${promocion.id}"
														class="botondes learn-more d-flex"> <span
														class="circle" aria-hidden="true"> <span
															class="icon arrow"></span>
													</span> <span class="button-text mx-auto">Ver</span>
													</a>
												</div>

												<c:if test="${usuario.esAdmin()}">
													<div class="d-flex mt-auto justify-content-center">
														<a
															href="/TP_3_SplashingPopcorn_Entrega_Final2/promocion/editarPromocion.ad"
															class="botondes learn-more d-flex"> <span
															class="circle" aria-hidden="true" id="botonAdmin">
																<span class="icon arrow"></span>
														</span> <span class="button-text mx-auto">Editar</span>
														</a>
													</div>
													<div class="d-flex mt-auto justify-content-center">
														<a
															href="/TP_3_SplashingPopcorn_Entrega_Final2/promocion/borrarPromocion.ad"
															class="botondes learn-more d-flex"> <span
															class="circle" aria-hidden="true" id="botonAdmin">>
																<span class="icon arrow"></span>
														</span> <span class="button-text mx-auto">Eliminar</span>
														</a>
													</div>
												</c:if>

											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- PAGINADOR -->
						<div
							class="row text-center m-0 mt-auto p-4 border-top border-dark">
							<div class="page_navigation"></div>
						</div>
					</div>




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
						<form
							action="/TP_3_SplashingPopcorn_Entrega_Final2/promocion/crearPromocion.ad"
							method="post">

							<label for="titulo">Titulo de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" required value="${promocion.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>

							<div class="form-floating mt-5 mb-3">
								<label for="pelicula1">Elija una película:</label> <input
									list="listaPeliculas" id="pelicula1" name="pelicula1" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula1">
										<option value="${pelicula1.id}"><c:out value="${pelicula.titulo}"></c:out>
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="pelicula2">Elija una película:</label> <input
									list="listaPeliculas" id="peliculasEnPromos"
									name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula2">
										<option value="${pelicula2.id}"><c:out value="${pelicula.titulo}"></c:out>
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="pelicula3">Elija una película:</label> <input
									list="listaPeliculas" id="pelicula3" name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula3">
										<option value="${pelicula3.id}"><c:out value="${pelicula.titulo}"></c:out>
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
								<label for="urlPortada">Foto de portada</label>
								<input type="file" class="form-control"
									id="urlPortada" name="urlPortada" required
									value="${promocion.urlPortada}"> 
								<div class="invalid-feedback">Introduzca una imagen por
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
						<form
							action="/TP_3_SplashingPopcorn_Entrega_Final2/promocion/editarPromocion.ad"
							method="post">
							<label for="titulo">Titulo de promoción</label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="titulo"
									name="titulo" required value="${promocion.titulo}">
								<div class="invalid-feedback">Introduzca su nombre por
									favor</div>
							</div>

							<div class="form-floating mt-5 mb-3">
								<label for="pelicula1">Elija una película</label> <input
									list="listaPeliculas" id="pelicula1" name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula1">
										<option value="${pelicula1.id}"><c:out value="${pelicula.titulo}"></c:out>
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="pelicula2">Elija una película</label> <input
									list="listaPeliculas" id="pelicula2" name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula2">
										<option value="${pelicula2.id}"><c:out value="${pelicula.titulo}"></c:out></option>
									</c:forEach>
								</datalist>

							</div>
							<div class="form-floating mt-5 mb-3">
								<label for="pelicula3">Elija una película</label> <input
									list="listaPeliculas" id="pelicula3" name="peliculasEnPromos" />

								<datalist id="listaPeliculas">
									<c:forEach items="${peliculas}" var="pelicula3">
										<option value="${pelicula3.id}"><c:out value="${pelicula.titulo}"></c:out></option>
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
								<label for="urlPortada">Foto de portada</label>
								<input type="file" class="form-control"
									id="urlPortada" name="urlPortada" required
									value="${promocion.urlPortada}"> 
								<div class="invalid-feedback">Introduzca una imagen por
									favor</div>
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