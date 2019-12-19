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





    <div class="content-wrapper">
        <div class="w-container">
            <div class="w-dyn-list">
                <div class="w-dyn-items">

                    <h3>Bugs I have submitted</h3>
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


                                        <td><a href="/bugs/${instance.getId()}">${instance.errorCode}</a></td>
                                        <c:forEach items="${bug.getTechnologies() }" var="technology">
                                            <p>${technology.getName() } ${technology.getVersion() }</p>
                                        </c:forEach>


                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="col onSide">
                            <a href="favoriteBugs" class="btn btn-primary">All my favorite Bugs</a>
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