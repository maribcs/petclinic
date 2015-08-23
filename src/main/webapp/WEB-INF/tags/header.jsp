<header>
    <div class="container">
        <div class="logo">
            <span>PET</span><span>CLINIC</span>
            <span class="icon-pawprint6"></span>
        </div>
        <div class="user">
            <span class="icon-user photo"></span>
            <p>
                <span class="name">${sessionScope.USUARIO_AUTENTICADO.persona.nombreCompleto}</span>
            </p>
        </div>
        <div class="acciones">
            <a class="btn-default" href="${pageContext.request.contextPath}/logout">Salir</a>
        </div>
    </div>
</header>