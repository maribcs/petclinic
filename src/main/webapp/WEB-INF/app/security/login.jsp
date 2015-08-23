<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:wrapper title="Login">
    
    <form class="login" action="${pageContext.request.contextPath}/j_spring_security_check" method='post'>
        <div class="title">		
            <h1 class="logo">
                <span>PET</span><span>CLINIC</span>
                <span class="icon-pawprint6"></span>						
            </h1>
        </div>
        <div class="form-group">
            <input type="text" placeholder="Usuario" name="j_username"  required="true" >					
        </div>
        <div class="form-group">
            <input type="password" placeholder="Contraseña" name="j_password" required="true">
        </div>
        <button type="submit">Ingresar</button>
    </form>

</t:wrapper>