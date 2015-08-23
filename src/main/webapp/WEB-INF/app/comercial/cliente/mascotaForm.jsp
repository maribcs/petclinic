<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Mascota">
    <div class="head">
        <h1 class="maintitle"> Mascotas </h1>
    </div>

    <form action="${pageContext.request.contextPath}/com/mascota/save" method="post">

        <input type="hidden" name="id" value="${mascota.id}"/>

        <div class="form-group">
            <label> Propietario </label>

            <select name="propietario.id"   ${mascota.id !=  null ? 'disabled' : ""}> 
                <c:forEach items="${propietarios}" var="e" >
                    <option value="${e.id}"  ${mascota.propietario.id == e.id ? 'selected': '' }> ${e.persona.nombreCompleto} </option>
                </c:forEach>
            </select>
        </div>



        <div class="form-group">
            <label  > Nombre </label>
            <input type="text"    name="nombre" value="${mascota.nombre}" required="">
        </div>



        <div class="form-group">
            <label  > Nº Identificación </label>
            <input type="text"   name="nroIdentificacion" value="${mascota.nroIdentificacion}" required="">
        </div>


        <div class="form-group">
            <label  > Fecha de Nacimiento </label>
            <input type="date"   name="fechaNacimiento" value="${mascota.fechaNacimiento}" required="">
        </div>



        <div class="form-group">
            <label> Sexo </label>

            <div class="form-group-op">
                <label>
                    <input type="radio" name="sexo" value="0" ${mascota.sexo == 0 ? 'checked' : ''}> F
                </label>
                <label>
                    <input type="radio" name="sexo" value="1" ${mascota.sexo == 1 ? 'checked' : ''}> M
                </label>
            </div>
        </div>


        <div class="form-group">
            <label> Especie </label>

            <select name="especie.id" id="especie">
                <c:forEach items="${especies}" var="e" >
                    <option value="${e.id}"  ${mascota.especie.id == e.id ? 'selected': '' }> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label> Raza </label>

            <select name="raza.id" id="raza">
                <c:forEach items="${razas}" var="e" >
                    <option value="${e.id}"  ${mascota.raza.id == e.id ? 'selected': '' } class="${e.especie.id}"> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>



        <div class="form-group">
            <label> Color </label>
            <input type="text"   name="color" value="${mascota.color}" required="">
        </div>



        <div class="form-group">
            <button type="submit">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/mascota" class="btn-default">Cancelar</a>
        </div>
    </form>



    <script>
        $(function () {
            $('#raza').chained('#especie');
        })
    </script>


</t:wrapper>



