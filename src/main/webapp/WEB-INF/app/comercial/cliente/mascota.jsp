<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Mascotas">
    <div class="head">
        <c:choose>
            <c:when test="${propietario == null}">
                <h1 class="maintitle"> Mascotas </h1>
            </c:when>

            <c:when test="${propietario != null}">
                <h1 class="maintitle"> Mascotas de ${propietario.persona.nombreCompleto} </h1>
            </c:when>
        </c:choose>
        <a href="${pageContext.request.contextPath}/com/mascota/new" class="btn-default"><span class="icon-plus"></span> Nuevo</a>
    </div>

    <table class="table table-striped">      
        <thead>
            <tr>
                <th>Propietario</th>
                <th>Mascota</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${mascotas}" var="e">
                <tr>
                    <td>
                        <h4>${e.propietario.persona.nombreCompleto} </h4>
                    </td>
                    <td>
                        <h4>${e.nombre}</h4>
                        <div class="group2">
                            Fecha de Nacimiento: <fmt:formatDate value="${e.fechaNacimiento}" pattern="dd/MM/yyyy" /> <br/>
                            Nº Identificación: ${e.nroIdentificacion} <br/>
                            Sexo:  ${e.sexo == 1 ? "Macho" :"Hembra" }
                        </div>
                        <div class="group2">
                            Especie: ${e.especie.nombre} <br/>
                            Raza: ${e.raza.nombre} <br/>
                            Color: ${e.color}
                        </div>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/com/mascota/update/${e.id}" class="action"><span class="icon-bin2"></span>Editar</a> 
                        <a href="${pageContext.request.contextPath}/com/mascota/delete/${e.id}" class="action"><span class="icon-pencil"></span>Eliminar</a>
                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</t:wrapper>