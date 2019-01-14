<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script>
	var nav = {
		nextPage : function(button) {
			var menu = button.attr("id");
			$("#pageName").val(menu);
			$("#nav_frm").attr("action", menu + ".do");
			$("#nav_frm").submit();
		}
	};
	
	$(function() {
		$(".nav-item").click(function() {
			var button = $(this);
			
			nav.nextPage(button);
		});
	});
</script>
<form id="nav_frm" method="post">
	<input type="hidden" id="pageName" name="pageName">
</form>

<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="main.do">심플블로그</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li id="main" class="nav-item"><a class="nav-link" href="#">Home</a>
				</li>
				<li id="about" class="nav-item"><a class="nav-link" href="#">About</a>
				</li>
				<li id="write" class="nav-item"><a class="nav-link" href="#">
						write</a></li>
				<li id="contact" class="nav-item"><a class="nav-link" href="#">Contact</a>
				</li>
				<li id="stat" class="nav-item"><a class="nav-link" href="#">Stat</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
