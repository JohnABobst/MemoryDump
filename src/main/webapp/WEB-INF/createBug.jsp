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


</head>

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">

		

		<form:form action="/bugs/create" modelAttribute="bug" method="post">
			<p>
				<form:errors path="bug.*" />
			</p>
			<div class="form-group row">
				<label class="col-form-label">Error Code</label>
				<div class="col-sm-10">
					<form:textarea class="form-control" path="errorCode"></form:textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label">Technologies</label>
				<div class="col-sm-8">

					<c:forEach items="${technologies}" var="technology">
						<form:checkbox path="technologies" value="${technology.getId()}" />${technology.getName()} ${technology.getVersion()}
							
							</c:forEach>


				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label">Additional Details</label>
				<div class="col-sm-10">
					<form:textarea class="form-control" path="additionalDetails"></form:textarea>
				</div>
			</div>
			<form:input type="hidden" path="creator" value="${user.id}"></form:input>
			<input type="submit" class="btn btn-success" />

		</form:form>


		<form class="ajax_post" method="POST">
			<label> Name </label> <input type="text" name="name" /> <label>
				Version </label> <input type="text" name="version" /> <input type="submit" />
		</form>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(document).on("submit", "ajax_post", function(event) {
			console.log("Working?")
			event.preventDefault();
			data = $(this).serialize();
			$.ajax({
				type : "POST",
				url : "/technologies",
				data : data,
				success : function(serverResponse) {
					$("insert").append(serverResponse)
				}
			})
		})
	})
</script>
</html>