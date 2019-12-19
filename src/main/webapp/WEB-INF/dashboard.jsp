<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
</head>

<body>
	<jsp:include page="navbar.jsp" />

	<td><a href="/bugs/${instance.getId()}">${instance.errorCode}</a></td>
	<td><c:forEach items="${bug.getTechnologies() }" var="technology">
			<p>${technology.getName() }${technology.getVersion() }</p>
		</c:forEach></td>
	<td><a href="/bugs/${instance.id}/edit">Edit</a></td>



		<h3>My Bugs</h3>
		<a href="/bugs/new">Create A Bug ticket</a>
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


							<td>
                <a href="/bugs/${instance.getId()}">${instance.errorCode}</a>
              </td>
              <td>
                  <c:forEach items="${bug.getTechnologies() }" var="technology">
								${technology.getName() }${technology.getVersion() } 
							  </c:forEach>
              </td>
							

						</tr>
					</c:forEach>
				</tbody>
			</table>
	

		
			<h3>My Favorite Bugs</h3>
			<div class="someKindOfContainer">
				<table class="table table-hover col">
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
								<td>
								<c:forEach items="${bookmark.getTechnologies() }"
									var="technology">
									<p>${technology.getName() }${technology.getVersion() }</p>
								</c:forEach>
								</td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			
			<h3>My Solved Bugs</h3>
			<div class="someKindOfContainer">
				<table class="table table-hover col">
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
								<td>
								<c:forEach items="${bug.getTechnologies() }"
									var="technology">
									<p>${technology.getName() }${technology.getVersion() }</p>
								</c:forEach>
								</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		

		<div class="col onSide">
			<a href="favoriteBugs" class="btn btn-primary">All my favorite
				Bugs</a>
			<hr>
			<a href="solvedBugs" class="btn btn-primary">All my solved Bugs</a>
			<hr>
			<a href="bugsISolved">All the Bugs I have solved</a>
		</div>
	</div>





	</div>
	</div>
	</div>
	</div>


	<jsp:include page="footer.jsp" />

</body>

</html>