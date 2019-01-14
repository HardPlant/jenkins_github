<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function(){
		var isShowFullPostButton = "<c:out value='${showFullPostButton}'/>";
		
		if (!isShowFullPostButton) {
			var button = "<a class='btn btn-primary float-right' href='fullposts.do'>Older Posts&rarr;</a>"
			$("#showButton").append(button);
		};
	});
</script>
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1><c:out value="${blogName}"/></h1>
					<span class="subheading"><c:out value="${blogDesc}"/></span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<c:forEach items="${postList}" var="postListVar" varStatus="status">
				<div class="post-preview" x-post-id=<c:out value="postListVar.postId"/>>
					<a href=<c:out value="post.do?postId=${postListVar.postId}"/>>
						<h2 class="post-title">
							<c:out value="${postListVar.title}"/>
						</h2>
						<h3 class="post-subtitle">
							<c:out value="${postListVar.subtitle}"/>
						</h3>
					</a>
					<p class="post-meta">
						<a href='#'><c:out value="${postListVar.author}"/></a> 님이 
						<c:out value="${postListVar.date}"/> 에 포스트함
					</p>
				</div>
			</c:forEach>
			<hr>
			
			<!-- Pager -->
			<div id="showButton" class="clearfix">

			</div>
		</div>
	</div>
</div>
