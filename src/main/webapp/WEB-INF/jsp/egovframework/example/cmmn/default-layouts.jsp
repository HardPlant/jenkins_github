<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="content_script" />
</head>

<body>
	<!-- Navigation -->
	<tiles:insertAttribute name="nav" />

	<tiles:insertAttribute name="content" />
	<!-- Footer -->
	<tiles:insertAttribute name="footer" />
</body>

</html>
