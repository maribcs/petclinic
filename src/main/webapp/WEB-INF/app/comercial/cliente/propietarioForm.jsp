<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Propietario">
    <div class="head">
        <h1 class="maintitle"> Propietario </h1>
    </div>

    <form action="${pageContext.request.contextPath}/com/propietario/save" method="post">
        
        <input type="hidden" name="id" value="${propietario.id}"/>
       
        <jsp:include page="../../general/persona/personaForm.jsp" />
       

        <div class="form-group">
            <button type="submit">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/propietario" class="btn-default">Cancelar</a>
        </div>
    </form>
            
</t:wrapper>
