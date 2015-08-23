<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Veterinario">
    <div class="head">
        <h1 class="maintitle"> Veterinario </h1>
    </div>
    
    <form action="${pageContext.request.contextPath}/gen/veterinario/save" method="post">
        
        <input type="hidden" name="id" value="${veterinario.id}"/>
       
        <jsp:include page="personaForm.jsp" />
       
        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/gen/veterinario" class="btn-default">Cancelar</a>
    </form>
            
</t:wrapper>