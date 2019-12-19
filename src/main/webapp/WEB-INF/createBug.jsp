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

</head>

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container padMe">
		<div class="personalSquares">

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
					<div class="col-sm-8" id="insert">

						<c:forEach items="${technologies}" var="technology">
							<form:checkbox path="technologies" value="${technology.getId()}" />${technology.getName()}
							${technology.getVersion()}

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

		</div>
		<form class="ajax_post">
			<label>
				Name
			</label>
			<input type="text" name="name" />

			<label>
				Version
			</label>
			<input type="text" name="version" />
			<input type="submit" />
		</form>
	</div>
	<jsp:include page="footer.jsp" />

</body>

<script type="text/javascript">
	$(document).ready(function () {
		$(document).on("submit", ".ajax_post", function (event) {
			console.log("Working?");
			event.preventDefault();
			data = $(this).serialize();
			$.ajax({
				type: "POST",
				url: "/technologies",
				data: data,
				success: function (serverResponse) {
					$("#insert").append(serverResponse);
					$(serverResponse).prop("checked", true);
				}
			})
		})
	})




</script>

</html>