<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="org.springframework.web.servlet.support.RequestContext"%> 

<!-- x nav modificar -->
<link href='<c:url value="/views/ui/css/bootstrap-responsive.2.min.css"/>' rel="stylesheet">
<link href='<c:url value="/views/ui/css/bootstrap.2.min.css"/>' rel="stylesheet">

<!--<link rel="stylesheet" type="text/css" href='<c:url value="/views/ui/css/bootstrap.3.min.css"/>'>-->

<link href='<c:url value="/views/ui/css/master.css"/>' rel="stylesheet">

<!-- https://github.com/VinceG/Bootstrap-Admin-Theme -->

<script type="text/javascript" src='<c:url value="/views/ui/js/jquery-1.12.4.js" />'></script>
<script type="text/javascript" src='<c:url value="/views/ui/js/bootstrap.2.3.2.min.js" />'></script>

<%--  <script type="text/javascript" src='<c:url value="/views/ui/js/master.js" />'></script> --%>

<script type="text/javascript" src='<c:url value="/views/ui/js/modernizr-2.6.2-respond-1.1.0.min.js" />'></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- icono -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="dia" value="${now}" pattern="d" />
<!-- <link rel="shortcut icon" id="favicon" type="image/x-icon" href="https://calendar.google.com/googlecalendar/images/favicon_v2014_${dia}.ico"> -->
<link rel="icon" id="favicon" type="image/x-icon" href="https://calendar.google.com/googlecalendar/images/favicon_v2014_${dia}.ico">
<!--  <link rel="icon" href="<c:url value='/views/ui/imagenes/agenda.png'/>"> --> 

<% String lang = (new RequestContext(request)).getLocale().getLanguage(); %>
<script type="text/javascript">
	var localeLanguage='<%=lang%>';
</script>


<script type="text/javascript" src="<c:url value="/views/ui/calendario/eventoCancelar.js" />"></script>