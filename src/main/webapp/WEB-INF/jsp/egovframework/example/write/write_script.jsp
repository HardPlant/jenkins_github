<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- Include CSS for icons. -->
<link href="css/font_awesome.min.css" rel="stylesheet" type="text/css" />

<!-- Include Editor style. -->
<link href="css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="css/froala_style.min.css" rel="stylesheet" type="text/css" />

<!-- Include Editor JS files. -->
<script type="text/javascript" src="js/froala_editor.pkgd.min.js"></script>

<!-- Initialize the editor. -->
<script>
  $(function() {
    $('#content').froalaEditor()
  });
</script>