<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Mascota">
    <h1 class="page-header"> Visita </h1>

    <form action="${pageContext.request.contextPath}/com/mascota/save" method="post">

        <input type="hidden" name="visita.id" value="${visita.id}"/>

        <div class="form-group">
            <label class="control-label"> Mascota </label>

            <select name="mascota.id" class="form-control" id="especie">
                <c:forEach items="${mascotas}" var="m" >
                    <option value="${m.id}"  ${visita.mascota.id == m.id ? 'selected': '' }> ${m.nombre} </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label class="control-label"> Veterinario </label>

            <select name="veterninario.id" class="form-control" id="especie">
                <c:forEach items="${veterinarios}" var="v" >
                    <option value="${v.id}"  ${visita.veterinario.id == v.id ? 'selected': '' }> ${v.persona.nombres} ${v.persona.apellidos}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label class="control-label"> Motivo </label>
            <input type="text" class="form-control" name="visita.motivo" value="${visita.motivo}" required="">
        </div>


        <div class="form-group">
            <label class="control-label"> Diagnóstico </label>
            <input type="text" class="form-control" name="visita.diagnostico" value="${visita.diagnostico}">
        </div>

        <div class="form-group">
            <label class="control-label"> Tratamiento </label>
            <input type="text" class="form-control" name="visita.tratamiento" value="${visita.tratamiento}">
        </div>

        <div class="form-group">
            <label class="control-label"> Dieta </label>
            <input type="text" class="form-control" name="visita.dieta" value="${visita.dieta}">
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/mascota" class="btn btn-link">Cancelar</a>
        </div>
    </form>
</t:wrapper>