<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Login-Registration</title>
	
</head>

<body> -->
	<jsp:include page="navbar.jsp" />
	<div class="container padMe">
		<div class="blah">
	
			<div class="personalSquares">
				<h1>Login</h1>
				<p>
					<c:out value="${error}" />
				</p>
				<form method="post" action="/login" class="form-group">
					<p>
						<label for="email">Email</label>
						<input type="text" id="email" name="email_l" class="form-control" />
					</p>
					<p>
						<label for="password">Password</label>
						<input type="password" id="password" name="password_l" class="form-control" />
					</p>
					<button type="submit" class="social-button ourYellow">Login</button>
				</form>
			</div>


			<div class="cheating"></div>

			<div class="personalSquares">
				<h1>Register!</h1>
	
				<p>
					<form:errors path="user_r.*" />
				</p>
	
				<form:form method="POST" action="/registration" class="form-group" modelAttribute="user_r">
					<p>
						<form:label path="name">Name:</form:label>
						<form:input type="text" path="name" class="form-control"/>
					</p>
					<p>
						<form:label path="email">Email:</form:label>
						<form:input type="email" path="email" class="form-control" />
					</p>
					<p>
						<form:label path="password">Password:</form:label>
						<form:password path="password" class="form-control" />
					</p>
					<p>
						<form:label path="passwordConfirmation">Password Confirmation:</form:label>
						<form:password path="passwordConfirmation" class="form-control"/>
					</p>
					<button type="submit" class="social-button ourYellow">Register</button>
				</form:form>
			</div>


		</div>
	</div>
	<jsp:include page="footer.jsp" />