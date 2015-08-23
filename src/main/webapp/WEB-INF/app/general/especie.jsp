<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Especies">
    <div class="head">
        <h1 class="maintitle"> Especies </h1>
    </div>

    <form action="${pageContext.request.contextPath}/gen/especie/save" method="post" class="form-inline">
        <input type="hidden" name="id" value="${especie.id}"/>

        <div class="form-group">
            <input type="text" placeholder="Especie" name="nombre" value="${especie.nombre}" required="">
        </div>

        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/gen/especie" class="btn-default">Cancelar</a>
    </form>

    <table>
        <thead>
            <tr>
                <th>Especie</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${especies}" var="e"  >
                <tr>
                    <td> 
                        ${e.nombre}
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/gen/especie/update/${e.id}" class="action"><span class="icon-bin2"></span> Editar</a> 
                        <a href="${pageContext.request.contextPath}/gen/especie/delete/${e.id}" class="action"><span class="icon-pencil"></span> Eliminar</a>
                    </td>
                </tr>
            </c:forEach>

        </tbody>       
    </table>
</t:wrapper>