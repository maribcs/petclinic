<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Propietarios">
    <div class="head">
        <h1 class="maintitle"> Propietarios </h1>
        <a href="${pageContext.request.contextPath}/com/propietario/new" class="btn-default"><span class="icon-plus"></span> Nuevo</a>
    </div>

    <table>        
        <thead>
            <tr>
                <th>Propietarios</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${propietarios}" var="p">
                <tr>
                    <td>
                        <h4>${p.persona.nombreCompleto}</h4>
                        <div class="group2">
                            Fecha de Registro: <fmt:formatDate value="${p.fechaRegistro}" pattern="dd/MM/yyyy" /> <br/>
                            ${p.persona.email} <br/>
                            ${p.persona.celular}
                        </div>
                        <div class="group2">
                            ${p.persona.direccion} <br/>
                            ${p.persona.telefono}
                        </div>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/com/propietario/update/${p.id}" class="action"><span class="icon-bin2"></span>Editar</a> 
                        <a href="${pageContext.request.contextPath}/com/propietario/delete/${p.id}" class="action"><span class="icon-pencil"></span>Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>        
    </table>
</t:wrapper>