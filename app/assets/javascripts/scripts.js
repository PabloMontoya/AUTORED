$(document).on('ready', function(){

	$('#search').on('click',function(){
		
		if ($.trim($("#searchbycodetxt").val()) != "" && $.trim($("#marca_combo").val()) === "" && $.trim($("#modelo_combo").val()) === "" && $.trim($("#anhio_combo").val()) === "") {
			var elemento = $('.contenido');
			var elemento2 = $('#filtros');
			var elemento3 = $('#loading');
			var elemento4 = $('#contenedor_select_id');
			elemento.css('display', 'block'),
			elemento2.css('width','19%'),
			elemento3.css('display', 'block'),
			elemento4.css('display', 'block')
			setTimeout(function(){ $('#loading').css('display','none'); },1750)
		}else if ($.trim($("#searchbycodetxt").val()) !== "" && ($.trim($("#marca_combo").val()) === "" || $.trim($("#modelo_combo").val()) === "" || $.trim($("#anhio_combo").val()) === "")) {
			alert('Si deseas buscar un código, no selecciones ninguna marca, modelo o año.');
	        return false;
		}
		else if ($.trim($("#marca_combo").val()) === "" || $.trim($("#modelo_combo").val()) === "" || $.trim($("#anhio_combo").val()) === "") {
	        alert('Llena todos los campos marcados por *');
	        return false;
	    } else { 
			var elemento = $('.contenido');
			var elemento2 = $('#filtros');
			var elemento3 = $('#loading');
			var elemento4 = $('#contenedor_select_id');
			elemento.css('display', 'block')
			elemento2.css('width','19%')
			elemento3.css('display', 'block')
			elemento4.css('display', 'block')
			setTimeout(function(){ $('#loading').css('display','none'); },1750)}
	});

	$('#searchbycode').on('click',function(){
		
		if ($.trim($("#searchbycodetxt").val()) != "" && $.trim($("#marca_combo").val()) === "" && $.trim($("#modelo_combo").val()) === "" && $.trim($("#anhio_combo").val()) === "") {
			var elemento = $('.contenido');
			var elemento2 = $('#filtros');
			var elemento3 = $('#loading');
			var elemento4 = $('#contenedor_select_id');
			elemento.css('display', 'block'),
			elemento2.css('width','19%'),
			elemento3.css('display', 'block'),
			elemento4.css('display', 'block')
			setTimeout(function(){ $('#loading').css('display','none'); },1750)
		}else if ($.trim($("#searchbycodetxt").val()) !== "" && ($.trim($("#marca_combo").val()) === "" || $.trim($("#modelo_combo").val()) === "" || $.trim($("#anhio_combo").val()) === "")) {
			alert('Si deseas buscar un código, no selecciones ninguna marca, modelo o año.');
	        return false;
		}
		else if ($.trim($("#marca_combo").val()) === "" || $.trim($("#modelo_combo").val()) === "" || $.trim($("#anhio_combo").val()) === "") {
	        alert('Llena todos los campos marcados por *');
	        return false;
	    } else { 
			var elemento = $('.contenido');
			var elemento2 = $('#filtros');
			var elemento3 = $('#loading');
			var elemento4 = $('#contenedor_select_id');
			elemento.css('display', 'block')
			elemento2.css('width','19%')
			elemento3.css('display', 'block')
			elemento4.css('display', 'block')
			setTimeout(function(){ $('#loading').css('display','none'); },1750)}
	});
		
	$('#clear').on('click',function(){
		var elemento = $('.contenido');
		var elemento2 = $('#filtros');
		var elemento4 = $('#contenedor_select_id');
		elemento.css('display', 'none'),
		elemento2.css('width','90%'),
		elemento4.css('display', 'none');
	});

	$('#form').keypress(function() {
		var elemento1 = $('.contenido').css('display');
		var elemento2 = $('#loading');

		if (elemento1 === 'block') {
			elemento2.css('display', 'block')
			setTimeout(function(){ elemento2.css('display','none'); },1750)
		} 
	})


});