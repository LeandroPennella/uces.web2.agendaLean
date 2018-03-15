<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value="/views/ui/js/jquery-ui-1.11.4.js" />"></script>
<link href='<c:url value="/views/ui/css/jquery-ui.css"/>' rel="stylesheet">
<script type="text/javascript">
var nombres = [];
var listaInvitados = [];

function agregarALista(id, nombre)
{
	  //todo: agregar estadox
	  $("#listadoUsuariosTentativo").append(
		  '<li id='+id+'>'+
		  	'<a href="/user/messages"><span class="tab">'+nombre+'</span></a>'+
		  	'<a onclick="sacarDeLista(this)">X</a></li>');
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
			for(var j=0; j<listaInvitados.length; j++) {
				if(listaInvitados[j].id == data[i].id) {	
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
	  				
	  				agregarALista(ui.item.id, ui.item.label);
	  				
	  				//todo:borrar contenido
	  				//$(this).val('');
				}
		
			}
		)
	} 	 
);

$(
	function(){		 //pasar a funcion cargar(listaInvitados);	
	<c:forEach var="invitacion" items="${reunionForm.invitaciones}">
		listaInvitados.push({
			id: "${invitacion.usuario.id}" , 
			nombre:  "${invitacion.usuario.nombreUsuario}" + " (${invitacion.usuario.nombre} ${invitacion.usuario.apellido})" , 
			estado:  "${invitacion.estado}"
		});
	    </c:forEach>
	    console.log(listaInvitados)
	//inicializar()
	})
</script>