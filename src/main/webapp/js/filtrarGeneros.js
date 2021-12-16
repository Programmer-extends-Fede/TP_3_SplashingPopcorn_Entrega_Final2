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
		$('.card').css('transform', 'scale(0)');
		function hideCard(){
			$('.card').parent().hide();
		} setTimeout(hideCard,200);

		
		// MOSTRANDO PRODUCTOS =========================
		function showCard(){
			$('.card[data-type="'+genero+'"]').parent().show();
			$('.card[data-type="'+genero+'"]').css('transform', 'scale(1)');
		} setTimeout(showCard,200);
		
	});

	// MOSTRANDO TODOS LOS PRODUCTOS =======================

	$('.genero-item[data-type="todos"]').click(function(){
		function showAll(){
			$('.card').parent().show();
			$('.card').css('transform', 'scale(1)');
		} setTimeout(showAll,200);
	});
});