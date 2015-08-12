<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Propietarios">
    <a href="${pageContext.request.contextPath}/com/propietario/new" class="pull-right btn btn-primary"> Nuevo</a>
    <h1 class="page-header"> Propietarios </h1>


    <table class="table table-striped">
        <tr>
            <th class="col-md-10">Propietarios</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${propietarios}" var="p"  >
            <tr>
                <td> 
                    ${p.persona.nombreCompleto}  

                    <div class="row text-muted small">
                        <div class="col-md-6">
                            Fecha de Ingreso: <fmt:formatDate value="${p.fechaRegistro}" pattern="dd/MM/yyyy" /> <br/>
                            ${p.persona.email} <br/>
                            ${p.persona.celular}
                        </div>
                        <div class="col-md-6">
                            ${p.persona.direccion} <br/>
                            ${p.persona.telefono}
                        </div>
                    </div>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/com/propietario/update/${p.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/com/propietario/delete/${p.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>