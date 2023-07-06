<%@page import="dominio.Especialidad"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dominio.Pais"%>
<%@ page import="dominio.Medico"%>
<%@ page import="dominio.HorariosTrabajo"%>
<%@ page import="dominio.Telefono"%>
<%@ page import="dominio.Cobertura"%>
<%@page import="java.util.ListIterator"%>
<%@ page import="java.util.ArrayList"%>
    <%@ page import="dominio.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ver M�dico</title>
<style>
<jsp:include page="css/StyleSheet.css"></jsp:include>
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="js/code.jquery.com_jquery-3.7.0.min.js"></script>	
</head>
<body>
<div class="container">
	<div class="navbar">
		<div class="nav-title">
		<span class="material-symbols-outlined">
			ecg_heart
		</span>
			<h3>Sistema Cl�nica</h3>
		</div>

		<div class="items">
			<ul>
				<li>
				
				<a href="serverletsPacientes?method=get">
				<span class="material-symbols-outlined">
					groups
				</span>
				Pacientes</a>
				</li>
				
				<li> 
				
				 <a href="serverletsMedicos?method=get" class="active">
				 	<span class="material-symbols-outlined">
						clinical_notes
					</span>	
					M�dicos</a>
				 </li>
				
				
				<li>

					<a href="Turnos.jsp">				<span class="material-symbols-outlined">
					calendar_month
				</span>	Turnos</a>
				</li>
			</ul>
		</div>
		
				<div class="user-container">
			
			
			<%if(session.getAttribute("usuario") != null){
				Usuario user = (Usuario)session.getAttribute("usuario");
				%>	
				<strong><%= user.getCorreo() %></strong>
			<%} %>
			<a href="serverletsLogin?method=get" class="btn bg-green">Cerrar Sesi�n</a>
		</div>
	</div>
	<%		
		Medico medico = (Medico)request.getAttribute("medico"); 	
		%>
	
	<div class="container fd-column m-auto" style="width:100%;
    margin: 0px 100px;" visible="<% if(medico == null) {%> false <%}%>">
	<div class="title-section d-flex jc-sb" >
		<h1> M�dico</h1>

		
		
	</div>
	
	<div>		
		<form method="post" action="serverletsMedico" class="position-relative">
		
		<%
		Integer idMedico = 0;
		if(request.getAttribute("idMedico")!= null) Integer.parseInt(request.getAttribute("idMedico").toString());
		%>
			<input type="hidden" name="IdMedico" value="<%=idMedico %>"> 
			
			<div class="d-flex fd-column style-form" style="margin: 50px 0px;">
			
				<div class="d-flex row">
					<div class="d-flex fd-column">
						<label>DNI</label>
						<input disabled type="number" required="true" name="dni" class="campo" value="<%= medico.getDni()%>">
						<span id="dniError" class="error"></span>
					</div>
			
					<div class="d-flex fd-column">
						<label>Fecha de Nacimiento</label>
						<input type="Date" required="true" name="fechaNacimiento" class="campo" value="<%= medico.getFechaNacimiento()%>">
						<span id="fechaNacimientoError" class="error"></span>
					</div>
					
					<div class="d-flex fd-column">
						<label>Sexo</label>
						<select name="sexoSelect" class="select">
							<option value="F" <%if(medico.getSexo().contains("F")){%> selected="true"<%}%>>Femenino</option>
							<option  value="M" <%if(medico.getSexo().contains("M")){%> selected="true"<%}%>>Masculino</option>
							<option  value="O" <%if(medico.getSexo().contains("O")){%> selected="true"<%}%>>Otro</option>
						</select>
					</div>
					
				</div>
				
				<div class="d-flex row">
					<div class="d-flex fd-column">
						<label>Nombre</label>
						<input  type="text" required="true" name="nombre" class="campo" value="<%= medico.getNombre()%>">
						<span id="nombreError" class="error"></span>
					</div>
			
					<div class="d-flex fd-column">
						<label>Apellido</label>
						<input type="text" required="true" name="apellido" class="campo" value="<%= medico.getApellido()%>">
						<span id="apellidoError" class="error"></span>
					</div>
					
					<div class="d-flex fd-column">
						<label>Nacionalidad</label>
						<select name="nacionalidadSelect" class="select">
								<% 
								ArrayList<Pais> listaPaises = new ArrayList<Pais>();
								if(request.getAttribute("listaPaises") != null){
									listaPaises = (ArrayList<Pais>)request.getAttribute("listaPaises");
								}
								
								ListIterator <Pais> it = listaPaises.listIterator();
												while(it.hasNext())
				{
					Pais pais = it.next();
				%>
				<option value="<%= pais.getIdPais()%>"  <%if(medico.getNacionalidad().getDescripcion() == pais.getDescripcion()){%> selected="true"<%}%> ><%= pais.getDescripcion() %></option>
				<%
				}%>
						</select>
					</div>
				</div>
				
				<div class="d-flex row">
					<div class="d-flex fd-column w-50">
						<label>Correo Electr�nico</label>
						<input type="mail" required="true" name="correo" class="campo" value="<%= medico.getCorreo()%>">
						<span id="mailError" class="error"></span>
					</div>
			
				
								<div class="d-flex fd-column w-50">
								<label>Direcci�n</label>
								<input type="Text" required="true"  name="direccion" class="campo" value="<%= medico.getDomicilio().getDireccion()%>">
				</div>
						
				</div>
			
				<div class="d-flex row">
				
			</div>
			
			<div class="d-flex row">

				
								<div class="d-flex fd-column">
								<label>Localidad</label>
<input type="Text" required="true" name="localidad"  class="campo" value="<%= medico.getDomicilio().getLocalidad()%>">
				</div>
				
				<div class="d-flex fd-column">
								<label>Provincia</label>
<input type="Text" required="true" name="provincia"  class="campo" value="<%= medico.getDomicilio().getProvincia()%>">
				</div>
			
			
			<div class="d-flex fd-column">
								<label>Pais</label>
								<select name="paisSelect" class="select">
								<% 
								
								ListIterator <Pais> it2 = listaPaises.listIterator();
												while(it2.hasNext())
				{
					Pais pais = it2.next();
				%>
				<option value="<%= pais.getIdPais()%>"  <%if(medico.getNacionalidad().getDescripcion().toLowerCase() == pais.getDescripcion().toLowerCase()){%> selected="true"<%}%>><%= pais.getDescripcion() %></option>
				<%
				}%>
								
								</select>
							</div>	
							</div>
			<div class="d-flex row">
			
			
			</div>
			<div class="d-flex row">
				<div class="d-flex fd-column">
					<label>Especialidades</label>
					<select name="especialidadSelect" class="select">
						<option value="-1">Selecciona una especialidad</option>
						<%
						ArrayList<Especialidad> listaEspecialidades = new ArrayList<Especialidad>();
						if(request.getAttribute("listaEspecialidades") != null){
							listaEspecialidades = (ArrayList<Especialidad>)request.getAttribute("listaEspecialidades");
						}
						
						ListIterator <Especialidad> it3 = listaEspecialidades.listIterator();
						while(it3.hasNext()){
							Especialidad esp = it3.next();
						%>
						<option value="<%=esp.getIdEspecialidad() %>"><%=esp.getDescripcion() %></option>
						<%
						}%>
					</select>
				</div>
			</div>
			</div>
			
			<button type="submit" name="btn-agregar-medico" class="btn bg-green position-absolute" style="right:0;">Guardar M�dico</button>
		</form>
	</div>
	
	<div style="margin:60px 0px 0px 0px;border-top:1px solid blue; padding:10px 0px;">
	
	
	<div>	
	<div  class="filtro">
	<h3>Especialidades</h3> 
	
	<form action="serverletsEspecialidades"  method="get">
	 <input type="hidden" name="idMedico" value="<%=medico.getIdMedico() %>">
	  <input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
		<button type="submit" name="btn-nueva-especialidad" class="btn bg-green w-100">Agregar Especialidad</button>
	</form>
	</div>
	
	<table class="content-table header-table-blue w-100" id="tablaMedicos"> 
			<thead> 
				<tr> 
					<th>Especialidad</th>
					<th>Activo</th>
					<th>Acciones</th>
				</tr>
			</thead> 
			<tbody>		
			<tr>
			<form action="serverletsHorariosMedico" method="post" >
				<input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
			 	<input type="hidden" name="idMedico" value="<%=medico.getIdMedico() %>">
			 	<input type="hidden" name="idEspecialidad" value="id">
				<td>Nutrici�n</td>
				<td><button class="btn w-100 bg-green">Activo</button></td> 	
				<td class="d-flex">
					<button  type="submit"  name="btn-eliminar-especialidad " class="btn bg-red w-100">Eliminar  </button>
		 		</td>
			</form>
			</tr> 
			</tbody> 
		</table>
	</div>
	
	
	</div>	
	
	
	
<div style="margin:60px 0px 0px 0px; display:flex; border-top:1px solid blue; padding:10px 0px;">

	
	<br/>	
			<div style="margin-right:5px">	
	<div  class="filtro">
	<h3>Horarios</h3> 
	
	<form action="serverletsHorariosMedico"  method="get">
	 <input type="hidden" name="idMedico" value="<%=medico.getIdMedico() %>">
	  <input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
	<button type="submit" name="btn-nuevo-horario" class="btn bg-green w-100">Agregar Horario</button>
	</form>
	
	</div>	
	<%
	ArrayList<HorariosTrabajo> horariosMedico = new ArrayList<HorariosTrabajo>();

	if(request.getAttribute("listaHorariosMedico") != null){
		Object obj = request.getAttribute("listaHorariosMedico");
		if(obj instanceof ArrayList<?>){
			horariosMedico = (ArrayList<HorariosTrabajo>) obj;
		}
	}
	%>
	
	<%if(request.getAttribute("estadoHorario") != null){
	String mensaje = request.getAttribute("estadoHorario").toString(); %>
		<h3 style="font-weight: bold; color: green; margin: 20px 0 20px 0;">
      <%= mensaje %>
   </h3>
	<%}%>
		<table class="content-table header-table-blue w-100" id="tablaMedicos"> 
			<thead> 
				<tr> 
					<th>D�a</th>
					<th>Hora Entrada</th>
					<th>Hora Salida</th>
					<th>Activo</th>
					<th>Acciones</th>
				</tr>
			</thead> 
			<tbody>		
	<% if(horariosMedico.size() > 0){
	for(HorariosTrabajo horario: horariosMedico){
	String nombreClase = "bg-green" ;
	String textButtonActivo ="Activo";
	
	if(!horario.isActivo()) {
		nombreClase = "bg-red"; 
		textButtonActivo = "Inactivo";
	}
	%>
		
		<tr>
		<form action="serverletsHorariosMedico" method="post" >
		<input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
			 <input type="hidden" name="idMedico" value="<%=medico.getIdMedico() %>">
			 	 <input type="hidden" name="diaHorarioMedico" value="<%=horario.getDia() %>">
		<td><%=horario.getDia() %></td> 
		<td><%=horario.getHoraEntrada().toString() %>hs</td> 
		<td><%=horario.getHoraSalida().toString()  %>hs</td> 
									<td>
							<button class="btn w-100 <%= nombreClase%>">
							 <%= textButtonActivo%>
							</button>
							</td> 	
		<td class="d-flex">
		<button type="submit" name="btn-editar-horario-trabajo" class="btn bg-blue">Editar</button>
		<button  type="submit"  name="btn-eliminar-horario-trabajo" class="btn bg-red w-100">Eliminar  </button>
		 </td>
	</form>


	</tr> 
	<% }} %>
			</tbody> 
		</table>
	</div>
	
	
	<div  style="border-radius:10px;height:100%;">	
		<div  class="filtro">
			<h3>Telefonos</h3> 
				<form action="serverletsTelefono"  method="get">
	 <input type="hidden" name="idMedico" value="<%=medico.getIdMedico() %>">
	  <input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
	<button type="submit" name="btn-nuevo-telefono" class="btn bg-green w-100">Agregar Telefono</button>
	</form>
		</div>	
		
		<%
	ArrayList<Telefono> telefonosMedico = new ArrayList<Telefono>();

	if(request.getAttribute("listaTelefonosMedico") != null){
		Object obj = request.getAttribute("listaTelefonosMedico");
		if(obj instanceof ArrayList<?>){
			telefonosMedico = (ArrayList<Telefono>) obj;
		}
	}
	%>
	
		<%if(request.getAttribute("estadoTelefono") != null){
	String mensaje = request.getAttribute("estadoTelefono").toString(); %>
		<h3 style="font-weight: bold; color: green; margin: 20px 0 20px 0;">
      <%= mensaje %>
   </h3>
	<%}%>
		<table class="content-table header-table-blue" id="tablaMedicos"> 
			<thead> 
				<tr> 
					<th>Telefono</th>
					<th>Activo</th>
					<th>Acciones</th>
				</tr>
			</thead> 
			<tbody>		
			<% if(telefonosMedico.size() > 0){
			for(Telefono telefono: telefonosMedico){
			String nombreClase = "bg-green" ;
	String textButtonActivo ="Activo";
	
	if(!telefono.isActivo()) {
		nombreClase = "bg-red"; 
		textButtonActivo = "Inactivo";
	}
	%>
		
			<tr>
						<form action="serverletsTelefono" method="post" class="">
						<input type="hidden" name="dniMedico" value="<%=medico.getDni() %>">
						<input type="hidden" name="telefonoMedico" value="<%=telefono.getTelefono() %>">
							<td><%=telefono.getTelefono() %></td> 
<td>
							<button class="btn w-100 <%= nombreClase%>">
							 <%= textButtonActivo%>
							</button>
							</td> 	
							<td class="d-flex">
								<button type="submit" name="btn-editar-telefono" class="btn bg-blue">Editar</button>
								<button  type="submit"  name="btn-eliminar-telefono" class="btn bg-red w-100">Eliminar  </button>
							 </td>
						</form>
						

					</tr> 
			<% }} %>
			</tbody> 
		</table>
	</div>
	</div>
	</div>
	

	</div>
	<script src="js/validaciones.js"></script>	
</body>
</html>