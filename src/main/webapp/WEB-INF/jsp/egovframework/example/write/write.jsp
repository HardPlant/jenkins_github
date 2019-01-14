<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function() {
		var isOK = "<c:out value='${ok}'/>"
		if (isOK) {
			alert("게시글이 등록되었습니다.");
		}
		
		$("#sendMessageButton").click(function(){
			if ($("#content").val() != null && $("#content").val() != '') {
				$("#writeForm").submit();
			} else {
				alert("내용을 입력하세요!");
			}
		});
	});
</script>
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/contact-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>글쓰기</h1>
					<span class="subheading">게시글을 올린다.</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<p>아래 양식을 작성하여 게시글을 올린다.</p>
			<!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
			<!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
			<!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
			<form name="sentMessage" id="writeForm" method="post" novalidate>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>작성자</label> <input type="text" class="form-control"
							placeholder="작성자" id="author" name="author" required
							data-validation-required-message="작성자를 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<c:forEach items="${categoryList}" var="categoryListVar" varStatus="status">
						<label>
							<input type="checkbox" data-toggle="checkbox" name="selectCategory" value="${categoryListVar.categoryId}"/>
							<span>${categoryListVar.categoryNm}</span>
						</label>
					</c:forEach>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>제목</label> <input type="text" class="form-control"
							placeholder="제목" id="title" name="title" required
							data-validation-required-message="제목을 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>부제</label> <input type="text" class="form-control"
							placeholder="부제" id="subtitle" name="subtitle" required
							data-validation-required-message="부제를 입력하세요.">
						<p class="help-block text-danger"></p>
					</div>
				</div>

				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<textarea rows="5" class="form-control" placeholder="내용"
							id="content" name="content" required
							data-validation-required-message="내용을 입력하세요."></textarea>
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<br>
				<div id="success"></div>
				<div class="form-group">
					<button type="button" class="btn btn-primary"
						id="sendMessageButton">Send</button>
				</div>
			</form>
		</div>
	</div>
</div>
