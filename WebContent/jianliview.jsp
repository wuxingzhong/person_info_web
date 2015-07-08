<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src="./pdfobject/pdfobject.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			var success = new PDFObject({
				url : "./view.pdf"
			}).embed();
		};
	</script>
</head>
<body>
	<p>
		It appears you don't have Adobe Reader or PDF support in this web
		browser. <a href="./view.pdf">Click here to download the PDF</a>
	</p>

</body>
</html>