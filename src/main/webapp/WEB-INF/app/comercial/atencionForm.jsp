<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Atencion">
    <div class="head">
        <h1 class="maintitle"> Visita </h1>
    </div>

    <form action="${pageContext.request.contextPath}/com/atencion/save" method="post">

        <input type="hidden" name="id" value="${visita.id}"/>
        <div class="title-sec">Ingreso</div>
        <div class="form-group">
            <label> Mascota </label>

            <select name="mascota.id">
                <c:forEach items="${mascotas}" var="m" >
                    <option value="${m.id}"  ${visita.mascota.id == m.id ? 'selected': '' }> ${m.nombre} </option>
                </c:forEach>
            </select>
        </div>      

        <div class="form-group">
            <label > Motivo </label>
            <textarea name="motivo">${visita.motivo}</textarea>
        </div>

        <div class="title-sec">Atencion</div>

        <div class="form-group">
            <label > Veterinario </label>

            <select name="veterinario.id">
                <c:forEach items="${veterinarios}" var="v" >
                    <option value="${v.id}"  ${visita.veterinario.id == v.id ? 'selected': '' }> ${v.persona.nombreCompleto}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label> Diagnůstico </label>
            <textarea name="diagnostico">${visita.diagnostico}</textarea>
        </div>

        <div class="form-group">
            <label> Tratamiento </label>
            <textarea name="tratamiento">${visita.tratamiento}</textarea>
        </div>

        <div class="form-group">
            <label> Dieta </label>
            <textarea name="dieta">${visita.dieta}</textarea>
        </div>
        <div class="title-sec">Salida</div>
        <div class="form-group-op">
            <label class="radio-inline">
                <input type="checkbox" id="finalizado" name="finalizado" value="${visita.fechaSalida != null ? '1' : '0'}" ${visita.fechaSalida != null ? 'checked' : ''}> Salida
            </label>
        </div>
        <div class="form-group">
            <label> Proxima Visita </label>
            <input type="date" name="proximaVisita" value="${visita.proximaVisita}">
        </div>

        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/com/atencion" class="btn-default">Cancelar</a>

    </form>
        <script>
            $("#finalizado").change(function(){
               if($(this).is(":checked")){
                   $(this).val('1');
               } else {
                   $(this).val('0');
               }
            });
        </script>
</t:wrapper>