<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Display Bug</title>
</head>
<body>

    <!-- need to import user,bug instance onto this jsp: LM MS-->
    <jsp:include page="navbar.jsp"/>

    <div class="container">
        <div class="row-justify-content-center">
            <h1>${ bug.name }</h1>
        </div>

        <div class="row row-justify-content-between">
            <h6>${ bug.created_at}</h6>
            <h6>${ bug.technology.name } ${ bug.technology.version }</h6>
        </div>

        <div class="row">
            ${ bug.error }
        </div>

        <div class="row">
            ${ bug.code }
        </div>

        <div class="row">
            <ol>
                <c:forEach items="${ bug.steps }" var="intance">
                    <li>${ instance.content }</li>
                </c:forEach>
            </ol>
        </div>
            <c:forEach items="${ bug.comments }" var="comment">
                <p>${ comment.author.name } at ${ comment.create_at }</p>
                <p>${ comment.content }</p>


            </c:forEach>

        <!--this is the comment section-->
        <div class="row">



        </div>


    </div>

</body>
</html> 