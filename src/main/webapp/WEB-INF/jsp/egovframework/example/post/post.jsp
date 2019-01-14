<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("crcn", "\r\n");
%>
<script>
	$(function() {
		$("#header").css("background-image",
				"url(img/" + "<c:out value='${categoryList[0].imageUrl}'/>" + ")");
	});
</script>
<!-- Page Header -->
<header id="header" class="masthead">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-heading">
					<h1><c:out value="${post.title}"/></h1>
					<h2 class="subheading"><c:out value="${post.subtitle}"/></h2>
					<span class="meta">Posted by <a href="#"><c:out value="${post.author}"/></a>
						on <c:out value="${post.date}"/>
					</span>
					<span> 카테고리 : 
					<c:forEach items="${categoryList}" var="categoryListVar">
						<c:out value="${categoryListVar.categoryNm} "/>					
					</c:forEach>
					</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Post Content -->
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<p>
					<c:out value="${fn:replace(post.content,crcn, '<br>')}" escapeXml="false"/>
				</p>
			</div>
		</div>
	</div>
</article>