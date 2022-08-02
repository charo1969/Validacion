<%@page import="modelo.Billete"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Billete b= (Billete)session.getAttribute("billete");
	if(b == null){
		b = new Billete();
	}
	

%> 
	
	<h1>Detalles del billete</h1>
	
    <form action="procesarBillete" method="post">
        
        <div>
            <label for="nombre">Nombre <sub>*</sub>: </label>
            <input type="text" name="nombre" id="nombre" value="<%=b.getNombre() %>"
            	 required>
        </div>

        <div>
            <label for="edad">Edad <sub>*</sub>: </label>
            <input type="text" name="edad" id="edad" value="<%=b.getEdad() %>" required>
        </div>

        <div>
            <label for="dni">DNI <sub>*</sub>:</label>
            <input type="text" name="dni" id="dni" 
                pattern="[0-9]{1,8}[A-Z]{1}" value="<%=b.getDni() %>" required>
        </div>

        <div>
            <label for="tipoBillete">Billete: </label>
            <select name="tipoBillete" id="TipoBillete" >
                <option value="1"<%if(b.getTipoBillete()==1) out.print(" selected"); %>>Normal</option>
                <option value="2"<%if(b.getTipoBillete()==2) out.print(" selected"); %>>Joven</option>
                <option value="3"<%if(b.getTipoBillete()==3) out.print(" selected"); %>>3º Edad</option>
            </select>
        </div>
        <div>
            <label for="numPasajeros">Número de pasajeros:</label>
            <input type="text" name="numPasajeros" id="numPasajeros"
                value="<%=b.getNumPasajeros() %>"  required>
        </div>
        <div>
            <label for="">Modalidad: </label>
            <input type="radio" name="modalidad" id="ida" value="ida" <%if (!b.isIdayVuelta()){
            	
            	%> checked>
            
            <label for="ida">Ida</label>

            <input type="radio" name="modalidad" id="idayVuelta" value="idayVuelta">
            <label for="idayVuelta">Ida y vuelta</label>
        </div>
        <input type="submit" value="compra">
    </form>
    

 

</body>
</html>