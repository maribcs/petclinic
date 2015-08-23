<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Personal">
    <div class="head">
        <h1 class="maintitle">Personal</h1>
    </div>

    <form action="${pageContext.request.contextPath}/adm/personal/save" method="post">
        
        <input type="hidden" name="id" value="${usuario.id}"/>

        <jsp:include page="../../general/persona/personaForm.jsp" />
        
        <div class="form-group">
            <label>Perfil</label>
            <div class="form-group-op">
                <label>
                    <input type="radio" name="perfil" value="ADMIN" 
                           ${usuario.perfil == "ADMIN" ? 'checked' : ''}> Administrador
                </label>

                <label>
                    <input type="radio" name="perfil" value="ASIS" 
                           ${usuario.perfil == "ASIS" ? 'checked' : ''}> Asistente
                </label>
            </div>
        </div>
        <c:if test="${usuario.id != null}">
            <div class="form-group">
                <label> Estado </label>
                <div class="form-group-op">
                    <label>
                        <input type="radio" name="estado" value="ACT" 
                               ${usuario.estado == "ACT" ? 'checked' : ''}> Activo
                    </label>
                    <label>
                        <input type="radio" name="estado" value="INA" 
                               ${usuario.estado == "INA" ? 'checked' : ''}> Inactivo
                    </label>
                </div>
            </div>
        </c:if>        
        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/adm/personal" class="btn-default">Cancelar</a>

    </form>

</t:wrapper>