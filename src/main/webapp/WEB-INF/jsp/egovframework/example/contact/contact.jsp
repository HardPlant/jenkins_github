<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/contact-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>Contact Me</h1>
					<span class="subheading">Have questions? I have answers.</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<p>이름과 이메일, 할 말을 남겨주세요.</p>
			<!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
			<!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
			<!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
			<form name="sentMessage" id="contactForm" action="thank.do"
				novalidate>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>이름</label> <input type="text" class="form-control"
							placeholder="Name" id="name" name="name" required
							data-validation-required-message="Please enter your name.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>이메일</label> <input type="email"
							class="form-control" placeholder="Email Address" id="email"
							name="email" required
							data-validation-required-message="Please enter your email address.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>전화번호</label> <input type="tel" class="form-control"
							placeholder="Phone Number" id="phone" name="phone" required
							data-validation-required-message="Please enter your phone number.">
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>할 말</label>
						<textarea rows="5" class="form-control" placeholder="Message"
							id="message" name="message" required
							data-validation-required-message="Please enter a message."></textarea>
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<br>
				<div id="success"></div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary"
						id="sendMessageButton">보내기</button>
				</div>
			</form>
		</div>
	</div>
</div>
