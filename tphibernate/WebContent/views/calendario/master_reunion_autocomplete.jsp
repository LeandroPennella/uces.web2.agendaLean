<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<script src="<c:url value="/views/ui/js/jquery-ui-1.11.4.js" />"></script>
 --%>
<script type="text/javascript">
var nombres = [];
var listaInvitaciones = [];
/*
function agregarAListaImpresa(id, nombre)
{
	  //todo: agregar estadox
	  $("#listadoUsuariosTentativo").append(
		  '<li id='+id+'>'+
		  	'<a href="/user/messages"><span class="tab">'+nombre+'</span></a>'+
		  	'<a onclick="sacarDeLista(this)">X</a></li>');
}
*/
function agregarATablaInvitaciones(id, nombre)
{
	  //todo: agregar estadox
	  $("#tablaInvitaciones").append(
		  '<tr id='+id+'>'+
		  '<td>'+nombre+'</td>'+
		  '<td>pendiente</td>'+
	      '<td><input type="button" class="borrar" value="Eliminar" /></td>'+
		  '</tr>');
}

function sacarDeLista(elemento)
{
	  
    var id=elemento.parentNode.getAttribute("id");
    node=document.getElementById(id);
    node.parentNode.removeChild(node);
}


function llenarListaAutocompletar(data)
{
	  for(var i=0; i<data.length; i++) {
	  	//todo: revisar que no este ya invitado
			for(var j=0; j<listaInvitaciones.length; j++) {
				if(listaInvitaciones[j].id == data[i].id) {	
					estaInvitado = true;
					break;
				}
			}
	  	nombres.push(data[i].nombre + ", " + data[i].apellido);
	  	//agregarAListado(data[i].nombre + ", " + data[i].apellido);
	  }
	  return nombres;
	  //response(nombres.slice(0,5));
}

$(
	 function(){
	 $( "#usuariosAutocomplete" ).autocomplete
	    (
			{
		      	source: function( request, response ) {
			        $.ajax({
				        	url: 'listadoDeUsuarios.do',
				        	type: "GET",
				            data: {parteNombre: request.term},
			              	dataType : "json",
			              	//contentType : "application/json;charset=UTF-8",
				          success: function( data ) {
				        	  response(llenarListaAutocompletar(data));	  
				          }
	      			});
	  			},
	  			select: function (event, ui){
	  				agregarATablaInvitaciones(ui.item.id, ui.item.label);
	  				//todo:borrar contenido	//$(this).val('');
				}
			}
		)
	} 	 
);

$(document).on('click', '.borrar', function (event) {
    event.preventDefault();
    $(this).closest('tr').remove();
});

$(
	//carga invitaciones (usuarios+estados)
	function(){		 	
	<c:forEach var="invitacion" items="${reunionForm.invitaciones}">
		listaInvitaciones.push({
			id: "${invitacion.usuario.id}" , 
			nombre:  "${invitacion.usuario.nombreUsuario}" + " (${invitacion.usuario.nombre} ${invitacion.usuario.apellido})" , 
			estado:  "${invitacion.aceptado}"
		});
	    </c:forEach>
	    console.log(listaInvitaciones)
	//inicializar()
	})
</script>