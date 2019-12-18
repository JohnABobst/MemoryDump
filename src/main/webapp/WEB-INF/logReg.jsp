<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Login-Registration</title>
	<style>
		body {
			display: flex;
			justify-content: space-around;
		}

		.container {
			display: inline-block;
			vertical-align: top;
			border: 1px solid black;
			width: 400px;
			padding: 20px;
		}

		button {
			background-color: green;
			border-radius: 5px;
			padding: 10px 15px;
			border-color: green;
			color: white;
		}
	</style>
</head>

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="row justify-content-around pt-5">

			<div class="col-lg-5">
				<h1>Register!</h1>
	
				<p>
					<form:errors path="user_r.*" />
				</p>
	
				<form:form method="POST" action="/registration" modelAttribute="user_r">
					<p>
						<form:label path="name">Name:</form:label>
						<form:input type="text" path="name" />
					</p>
					<p>
						<form:label path="email">Email:</form:label>
						<form:input type="email" path="email" />
					</p>
					<p>
						<form:label path="password">Password:</form:label>
						<form:password path="password" />
					</p>
					<p>
						<form:label path="passwordConfirmation">Password Confirmation:</form:label>
						<form:password path="passwordConfirmation" />
					</p>
					<button type="submit">Register</button>
				</form:form>
			</div>
			<div class="col-lg-5">
				<h1>Login</h1>
				<p>
					<c:out value="${error}" />
				</p>
				<form method="post" action="/login">
					<p>
						<label for="email">Email</label>
						<input type="text" id="email" name="email_l" />
					</p>
					<p>
						<label for="password">Password</label>
						<input type="password" id="password" name="password_l" />
					</p>
					<button type="submit">Login</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>