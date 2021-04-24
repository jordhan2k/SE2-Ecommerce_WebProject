<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
		<input type= "text" name ="username" placeholder="User Name"/>
		<input type= "password" name ="password" placeholder="Password"/>
		<input type="checkbox" name = "remember"> Remember me</input>
		
		<h3>${alert}</h3>
		<button type="submit">Login</button>
	</form>
</body>
</html>