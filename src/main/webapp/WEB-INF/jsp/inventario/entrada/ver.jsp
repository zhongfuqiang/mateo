<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="entrada.ver.label" /></title>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top" role="navigation">
            <ul class="nav">
                <li><a href="<c:url value='/inicio' />"><s:message code="inicio.label" /></a></li>
                <li><a href="<c:url value='/inventario' />"><s:message code="inventario.label" /></a></li>
                <li><a href="<s:url value='/inventario/salida'/>" ><s:message code="salida.lista.label" /></a></li>
                <li class="active"><a href="<s:url value='/inventario/entrada'/>" ><s:message code="entrada.lista.label" /></a></li>
                <li><a href="<s:url value='/inventario/producto'/>" ><s:message code="producto.lista.label" /></a></li>
                <li><a href="<s:url value='/inventario/tipoProducto'/>" ><s:message code="tipoProducto.lista.label" /></a></li>
                <li><a href="<s:url value='/inventario/almacen'/>" ><s:message code="almacen.lista.label" /></a></li>
            </ul>
        </nav>

        <div id="ver-entrada" class="content scaffold-list" role="main">
            <h1><s:message code="entrada.ver.label" /></h1>

            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/inventario/entrada'/>"><i class="icon-list icon-white"></i> <s:message code='entrada.lista.label' /></a>
                <a class="btn btn-primary" href="<s:url value='/inventario/entrada/nuevo'/>"><i class="icon-shopping-cart icon-white"></i> <s:message code='entrada.nuevo.label' /></a>
            </p>
            <c:if test="${not empty message}">
                <div class="alert alert-block <c:choose><c:when test='${not empty messageStyle}'>${messageStyle}</c:when><c:otherwise>alert-success</c:otherwise></c:choose> fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <s:message code="${message}" arguments="${messageAttrs}" />
                </div>
            </c:if>

            <c:url var="eliminaUrl" value="/inventario/entrada/elimina" />
            <form:form commandName="entrada" action="${eliminaUrl}" >
                <form:errors path="*" cssClass="alert alert-error" element="ul" />
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="folio.label" /></div>
                    <div class="span11">${entrada.folio}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="estatus.label" /></div>
                    <div class="span11">${entrada.estatus.nombre}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="factura.label" /></div>
                    <div class="span11">${entrada.factura}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="fechaFactura.label" /></div>
                    <div class="span11">${entrada.fechaFactura}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="comentarios.label" /></div>
                    <div class="span11">${entrada.comentarios}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="tipoCambio.label" /></div>
                    <div class="span11">${entrada.tipoCambio}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="iva.label" /></div>
                    <div class="span11">${entrada.iva}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="total.label" /></div>
                    <div class="span11">${entrada.total}</div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="devolucion.label" /></div>
                    <div class="span11"><form:checkbox path="devolucion" disabled="true" /></div>
                </div>
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span1"><s:message code="almacen.label" /></div>
                    <div class="span11">${entrada.almacen.nombre}</div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th><s:message code="producto.label" /></th>
                                    <th style="text-align: right;"><s:message code="cantidad.label" /></th>
                                    <th style="text-align: right;"><s:message code="precioUnitario.label" /></th>
                                    <th style="text-align: right;"><s:message code="iva.label" /></th>
                                    <th style="text-align: right;"><s:message code="total.label" /></th>
                                    <c:if test="${puedeEditar}">
                                        <th><s:message code="acciones.label" /></th>
                                    </c:if>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${entrada.lotes}" var="lote" varStatus="status">
                                    <tr>
                                        <td>${lote.producto.nombre}</td>
                                        <td style="text-align: right;">${lote.cantidad}</td>
                                        <td style="text-align: right;">${lote.precioUnitario}</td>
                                        <td style="text-align: right;">${lote.iva}</td>
                                        <td style="text-align: right;">${lote.total}</td>
                                        <c:if test="${puedeEditar}">
                                            <td>
                                                <a href="<c:url value='/inventario/entrada/lote/elimina/${lote.id}' />" class="btn btn-mini btn-danger"><i class="icon-remove icon-white"></i></a>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th style="text-align: right;"><s:message code="subtotal.label" /></th>
                                    <th style="text-align: right;"><span class="${estiloTotales}">${subtotal}</span></th>
                                    <c:if test="${puedeEditar}">
                                        <th>${entrada.subtotal}</th>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th style="text-align: right;"><s:message code="iva.label" /></th>
                                    <th style="text-align: right;"><span class="${estiloTotales}">${iva}</span></th>
                                    <c:if test="${puedeEditar}">
                                        <th>${entrada.iva}</th>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th style="text-align: right;"><s:message code="total.label" /></th>
                                    <th style="text-align: right;"><span class="${estiloTotales}">${total}</span></th>
                                    <c:if test="${puedeEditar}">
                                        <th>${entrada.total}</th>
                                    </c:if>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <c:if test="${puedeEditar || puedeCerrar || puedePendiente || puedeEliminar || puedeEditarPendiente}">
                    <p class="well">
                        <c:if test="${puedeEditar}">
                            <a href="<c:url value='/inventario/entrada/edita/${entrada.id}' />" class="btn btn-primary"><i class="icon-edit icon-white"></i> <s:message code="editar.button" /></a>
                            <a href="<c:url value='/inventario/entrada/lote/${entrada.id}' />" class="btn btn-success"><i class="icon-shopping-cart icon-white"></i> <s:message code="nuevo.lote.button" /></a>
                        </c:if>
                        <c:if test="${puedeCerrar}">
                            <a href="<c:url value='/inventario/entrada/cerrar/${entrada.id}' />" class="btn btn-warning"><i class="icon-lock icon-white"></i> <s:message code="cerrar.button" /></a>
                        </c:if>
                        <c:if test="${puedePendiente}">
                            <a href="<c:url value='/inventario/entrada/pendiente/${entrada.id}' />" class="btn btn-warning"><i class="icon-asterisk icon-white"></i> <s:message code="pendiente.button" /></a>
                        </c:if>
                        <c:if test="${puedeEditarPendiente}">
                            <a href="<c:url value='/inventario/entrada/editaPendiente/${entrada.id}' />" class="btn btn-warning"><i class="icon-asterisk icon-white"></i> <s:message code="cerrar.button" /></a>
                        </c:if>
                        <c:if test="${puedeEliminar}">
                            <form:hidden path="id" />
                            <input type="submit" name="elimina" value="<s:message code='eliminar.button'/>" class="btn btn-danger icon-remove" style="margin-bottom: 2px;" onclick="return confirm('<s:message code="confirma.elimina.message" />');" />
                        </c:if>
                    </p>
                </c:if>
            </form:form>
        </div>
    </body>
</html>