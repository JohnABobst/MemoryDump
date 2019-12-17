<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Create Bug</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">
		<form:form action="">
<<<<<<< HEAD
			<p>
				<form:errors path="bug.*" />
			</p>
			<div class="form-group row">

				<label class="col-sm-2 col-form-label">Your Error Code</label>
=======
			<div class="form-group row">
				<form:errors path="errorCode"></form:errors>
				<label class="col-sm-2 col-form-label">Error Code</label>
>>>>>>> 0023c7177d99cb1212a6200808d3f384d6c917dd
				<div class="col-sm-10">
					<form:input type="text" class="form-control" path="errorCode"></form:input>
				</div>
			</div>
			<div class="form-group row">
<<<<<<< HEAD
				<label class="col-sm-2 col-form-label">Technologies</label>
				<div class="col-sm-10">
					<form:select multiple class="form-control" id="exampleFormControlSelect2" path="technologies">
						<form:option value="python">Python</form:option>
						<form:option value="python">Python</form:option>
						<form:option value="python">Python</form:option>
						<form:option value="python">Python</form:option>				
					</form:select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Error Description</label>
				<div class="col-sm-10">
					<form:textarea type="text" class="form-control"
						path="additionalDetails"></form:textarea>
				</div>
			</div>
			<form:input type="hidden" path="creator" value="{user.id}"></form:input>
=======
				<form:errors path="technologies"></form:errors>
				<label class="col-sm-2 col-form-label">Technologies</label>
				<div class="col-sm-10">
					<form:textarea rows="2" type="text" class="form-control" path="technologies"></form:textarea>
				</div>
			</div>
			<div class="form-group row">
				<form:errors path="description"></form:errors>
				<label class="col-sm-2 col-form-label">Error Description</label>
				<div class="col-sm-10">
					<form:textarea type="text" class="form-control" path="description"></form:textarea>
				</div>
			</div>
			<form:input type="hidden" path="user" value="{user.id}"></form:input>
>>>>>>> 0023c7177d99cb1212a6200808d3f384d6c917dd

		</form:form>
	</div>
</body>