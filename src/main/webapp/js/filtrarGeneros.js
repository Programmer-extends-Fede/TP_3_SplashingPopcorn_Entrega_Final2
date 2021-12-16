$(document).ready(function(){

	// AGREGANDO CLASE ACTIVE AL PRIMER ENLACE ====================
	$('.lista-generos .genero-item[data-type="todos"]').addClass('item-activado');

	// FILTRANDO PRODUCTOS  ============================================

	$('.genero-item').click(function(){
		var genero = $(this).attr('data-type');

		// AGREGANDO CLASE ACTIVE AL ENLACE SELECCIONADO
		$('.genero-item').removeClass('item-activado');
		$(this).addClass('item-activado');

		// OCULTANDO PRODUCTOS =========================
		$('.carta').css('transform', 'scale(0)');
		function hideCard(){
			$('.carta').parent().hide();
		} setTimeout(hideCard,200);

		
		// MOSTRANDO PRODUCTOS =========================
		function showCard(){
			$('.carta[data-type="'+genero+'"]').parent().show();
			$('.carta[data-type="'+genero+'"]').css('transform', 'scale(1)');
		} setTimeout(showCard,200);
		
	});

	// MOSTRANDO TODOS LOS PRODUCTOS =======================

	$('.genero-item[data-type="todos"]').click(function(){
		function showAll(){
			$('.carta').parent().show();
			$('.carta').css('transform', 'scale(1)');
		} setTimeout(showAll,200);
	});
});