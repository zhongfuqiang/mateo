<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="activoFijo.label" /></title>
    </head>
    <body>
        <jsp:include page="menu.jsp" >
            <jsp:param name="menu" value="principal" />
        </jsp:include>
        <h1><s:message code="activoFijo.label" /></h1>
        <hr />
        <h3><s:message code="reportes.label" /></h3>
        <div class="well">
            <div class="row-fluid">
                <h5><a href="<c:url value='/activoFijo/activo/depreciacionAcumuladaPorCentroDeCosto' />"><s:message code="depreciacionAcumuladaPorCentroDeCosto.label" /></a></h5>
            </div>
        </div>
    </body>
</html>
