<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Veterinarios">
    <div class="head">
        <h1 class="maintitle"> Veterinarios </h1>
        <a href="${pageContext.request.contextPath}/gen/veterinario/new" class="btn-default" ><span class="icon-plus"></span> Nuevo</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Veterinario</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${veterinarios}" var="e"  >
                <tr>
                    <td>
                        <h4>${e.persona.nombreCompleto} </h4>
                        <div class="group2">
                            Fecha de Ingreso: <fmt:formatDate value="${e.fechaRegistro}" pattern="dd/MM/yyyy" /> <br/>
                            ${e.persona.email} <br/>
                            ${e.persona.celular}
                        </div>
                        <div class="group2">
                            ${e.persona.direccion} <br/>
                            ${e.persona.telefono}
                        </div>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/gen/veterinario/update/${e.id}" class="action" title="Editar"><span class="icon-bin2"></span></a> 
                        <a href="${pageContext.request.contextPath}/gen/veterinario/delete/${e.id}" class="action" title="Eliminar"><span class="icon-pencil"></span></a>
                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>


</t:wrapper>