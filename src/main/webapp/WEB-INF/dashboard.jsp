<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="container" style="margin-top:50px;">

        <div class="row pt-5 justify-content-around">

            <div class="row justify-content-between">
                <h3>Bugs I have submitted</h3>
                <a href="/bugs/new">Create A Bug ticket</a>
            </div>

            <!-- the first table with all the bug/help tickets that you are waiting for to be solved-->
            <div class="col-lg-10">
                <table class="table table-hover">
                    <thead>
                        <tr>
                           
                            <th scope="col">Error Code</th>
                         	<th scope="col">Technologies</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ bugs }" var="instance">
                            <tr>                        
                                <td><a href="/bugs/${instance.getId()}">${instance.errorCode}</a></td>
                            	<c:forEach items="${bug.getTechnologies() }" var="technology">
                            	<p>${technology.getName() } ${technology.getVersion() }</p>
                            	</c:forEach>
                            	<td><a href="/bugs/${instance.getId()}/edit">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="col-lg-3">
                <a href="favoriteBugs" class="btn btn-primary">All my favorite Bugs</a>
                <hr>
                <a href="solvedBugs" class="btn btn-primary">All my solved Bugs</a>
                <hr>
                <a href="bugsISolved">All the Bugs I have solved</a>
            </div>
        </div>

    </div>


    <jsp:include page="footer.jsp" />

</body>

</html>