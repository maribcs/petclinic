<%@tag description="General Layout" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@attribute name="title" required="true"%>
<%@attribute name="js" fragment="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/petclinic/css/iconfont.css" type="text/css" />
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/petclinic/css/style.css" type="text/css" />
        

        <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/chained/chained.min.js"></script>

        <title>Pet Clinic - ${title}</title>
    </head>

    <body>
        <sec:authorize access="isAuthenticated()">
            <jsp:include page="/WEB-INF/tags/header.jsp"/>
        </sec:authorize>
        <div class="main">
            <sec:authorize access="isAuthenticated()">
                <div class="col-left">
                    <jsp:include page="/WEB-INF/tags/sidebar.jsp"/>
                </div>
                <div class="col-right">
                    <jsp:doBody/>
                </div>
            </sec:authorize>

            <sec:authorize access="isAnonymous()">
                <jsp:doBody/>
            </sec:authorize>
        </div>

    </body>
</html>