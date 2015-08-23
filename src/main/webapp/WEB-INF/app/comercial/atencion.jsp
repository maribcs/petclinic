<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<t:wrapper title="Atencion">
    <div class="head">
        <h1 class="maintitle"> Visita </h1>
        <a href="${pageContext.request.contextPath}/com/atencion/new" class="btn-default"> Nuevo</a>
    </div>  
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Ingreso</th>
                <th>Atencion</th>
                <th>Salida</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${visitas}" var="v">
                <tr>
                    <td>
                        <h4>${v.mascota.nombre}</h4>
                        <div class="group2">
                            Especie: ${v.mascota.especie.nombre} <br/>
                            Raza: ${v.mascota.raza.nombre}
                        </div>
                        <div class="group2">
                            Fecha Ingreso: <fmt:formatDate value="${v.fechaIngreso}" pattern="dd/MM/yyyy" /> <br/>
                            Motivo: ${v.motivo}
                        </div>
                    </td>
                    <td>
                        Veterinario: ${v.veterinario.persona.nombreCompleto}
                    </td>
                    <td>                       
                        <c:if test="${v.fechaSalida != null}">                 
                            Fecha Salida: <fmt:formatDate value="${v.fechaSalida}" pattern="dd/MM/yyyy" /> <br/>
                            Proxima Visita: <fmt:formatDate value="${v.proximaVisita}" pattern="dd/MM/yyyy" /> 

                        </c:if>
                    </td>
                    <td>
                        <span class="label label-${v.fechaSalida == null ? "success" :"danger" }">
                            ${v.fechaSalida == null ? "Atencion" :"Finalizado" }
                        </span>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/com/atencion/state/${v.id}" class="action label label-${v.fechaSalida == null ? "success" :"danger" }" title="Finalizar">Finalizar</a>
                        <a href="${pageContext.request.contextPath}/com/atencion/update/${v.id}" class="action" title="Editar"><span class="icon-bin2"></span></a> 
                        <a href="${pageContext.request.contextPath}/com/atencion/delete/${v.id}" class="action" title="Eliminar"><span class="icon-pencil"></span></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</t:wrapper>
