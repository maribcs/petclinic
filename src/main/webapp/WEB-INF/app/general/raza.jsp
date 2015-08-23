<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Razas">
    <div class="head">
        <h1 class="maintitle">Razas</h1>
    </div>

    <form action="${pageContext.request.contextPath}/gen/raza/save" method="post" class="form-inline">
        <input type="hidden" name="id" value="${raza.id}"/>

        <div class="form-group">
            <select name="especie.id">
                <c:forEach items="${especies}" var="e" >
                    <option value="${e.id}"  ${raza.especie.id == e.id ? 'selected': '' }> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <input type="text" class="form-control" placeholder="Raza" name="nombre" value="${raza.nombre}" required="">
        </div>

        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/gen/raza" class="btn-default">Cancelar</a>
    </form>

    <table>
        <thead>
            <tr>
                <th>Raza</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${razas}" var="r"  >
                <tr>
                    <td> 
                        <h4>${r.nombre}</h4>
                        ${r.especie.nombre}
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/gen/raza/update/${r.id}" class="action"><span class="icon-bin2"></span> Editar</a> 
                        <a href="${pageContext.request.contextPath}/gen/raza/delete/${r.id}" class="action"><span class="icon-pencil"></span> Eliminar</a>
                    </td>
                </tr>
            </c:forEach>

        </tbody>       
    </table>


</t:wrapper>