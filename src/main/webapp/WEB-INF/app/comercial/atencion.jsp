<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<t:wrapper title="Atencion">
    <a href="${pageContext.request.contextPath}/com/atencion/ingreso" class="pull-right btn btn-primary"> Nuevo</a>
    <h1 class="page-header"> Atencion </h1>    
    <table class="table table-striped">
        <tr>
            <th class="col-md-10">Visitas</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${visitas}" var="v"  >
            <tr>
                <td> 
                    ${v.mascota.nombre}  
                    <div class="row text-muted small">
                        <div class="col-md-6">
                            ${v.mascota.especie.nombre} <br/>
                            ${v.mascota.raza.nombre}                            
                        </div>
                        <div class="col-md-6">
                            Fecha Ingreso: <fmt:formatDate value="${v.fechaIngreso}" pattern="dd/MM/yyyy" /> <br/>
                            Fecha Salida: 
                            <c:if test="${v.fechaSalida != null}">
                            <fmt:formatDate value="${v.fechaSalida}" pattern="dd/MM/yyyy" /> 
                            </c:if>                           
                        </div>
                    </div>
                </td>
                <td>
                    <c:if test="${v.fechaSalida == null}">                             
                    <a href="${pageContext.request.contextPath}/com/atencion/salida/${v.id}">Salida</a> 
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</t:wrapper>
