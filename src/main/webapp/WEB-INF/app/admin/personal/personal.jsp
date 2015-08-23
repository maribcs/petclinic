<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper  title="Personal">
    <div class="head">
        <h1 class="maintitle">Personal</h1>
        <a href="${pageContext.request.contextPath}/adm/personal/new" class="btn-default" ><span class="icon-plus"></span> Nuevo</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Personal</th>
                <th>Rol</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${usuarios}" var="e"  >
                <tr>
                    <td>
                        <h4>${e.persona.nombreCompleto}</h4>
                        <div class="group2">
                            ${e.persona.email} <br/>
                            ${e.persona.celular}
                        </div>
                        <div class="group2">
                            ${e.persona.direccion} <br/>
                            ${e.persona.telefono}
                        </div>
                    </td>
                    <td>
                        ${e.perfil == "ADMIN" ? "Administrador" :"Asistente" }
                    </td>
                    <td>
                        <span class="label label-${e.estado == "ACT" ? "success" :"danger" }">
                            ${e.estado == "ACT" ? "Activo" :"Inactivo" }
                        </span>
                    </td> 
                    <td>
                        <a href="${pageContext.request.contextPath}/adm/personal/update/${e.id}" class="action" title="Editar"><span class="icon-bin2"></span></a> 
                        <a href="${pageContext.request.contextPath}/adm/personal/delete/${e.id}" class="action" title="Eliminar"><span class="icon-pencil"></span</a>
                    </td>
                </tr>
            </c:forEach>            
        </tbody>
    </table>

</t:wrapper>