<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/navbar.css" rel="stylesheet" type="text/css">
</head>

<body>



	<div class="main">
		<jsp:include page="navbar.jsp" />
		<div class="container">

			<div class="padMe">
				<div class="title">
					<h3 class="inline-block">My Bugs</h3>
					<h3 class="inline-block"><a href="/bugs/new">Create A Bug
						ticket</a></h3>
				</div>
				<hr>
				<table class="myTable table table-hover">
					<thead>
						<tr>
							<th scope="col">Error Code</th>
							<th scope="col">Technologies</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ user.bugs }" var="instance">
							<tr>


								<td><a href="/bugs/${instance.getId()}">${instance.errorCode}</a>
								</td>
								<td><c:forEach items="${instance.getTechnologies() }"
										var="technology">
                                ${technology.getName() } ${ technology.getVersion() },
                            </c:forEach></td>
								<td><a href="/bugs/${instance.id}/edit">Edit</a> | <a
									href="/bugs/${instance.id}/destroy">Delete</a></td>

                                
                                <td><a href="/bugs/${instance.getId()}">${instance.errorCode}</a></td>
                                <td><c:forEach items="${bug.getTechnologies() }" var="technology">
                            	<p>${technology.getName() } ${technology.getVersion() }</p>
                            	</c:forEach></td>
                            	<td><a href="/bugs/${instance.id}/edit">Edit</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

                    <div class="someKindOfContainer">
                        <table class="table table-hover col">
                            <thead>
                                <tr>

                                    <th scope="col">Error Code</th>
                                    <th scope="col">Technologies</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ bugs }" var="instance">
                                    <tr>

				<h3>My Favorite Bugs</h3>
				<table class="myTable table-hover col">
					<thead>
						<tr>

							<th scope="col">Error Code</th>
							<th scope="col">Technologies</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ user.bugBookmarks }" var="bookmark">
							<tr>


								<td><a href="/bugs/${bookmark.getId()}">${bookmark.errorCode}</a></td>
								<td><c:forEach items="${bookmark.getTechnologies() }"
										var="technology">
										<p>${technology.getName() }${technology.getVersion() }</p>
									</c:forEach></td>


							</tr>
						</c:forEach>
					</tbody>
				</table>




				<h3>My Solved Bugs</h3>
				<table class="myTable table-hover col">
					<thead>
						<tr>

							<th scope="col">Error Code</th>
							<th scope="col">Technologies</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ user.bugs }" var="bug">
							<c:if test="${ bug.solved == true }">
								<tr>
									<td><a href="/bugs/${bug.getId()}">${bug.errorCode}</a></td>
									<td><c:forEach items="${bug.getTechnologies() }"
											var="technology">
											<p>${technology.getName() }${technology.getVersion() }</p>
										</c:forEach></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>

	</div>





	<jsp:include page="footer.jsp" />

</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("form").remove(".ajax_search");
	})
</script>

</html>