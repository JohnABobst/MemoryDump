<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <!-- nav bar-->
    <jsp:include page="navbar.jsp"/>
    
    <div class="container">

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
                        <th scope="col">#</th>
                        <th scope="col">Problem</th>
                        <th scope="col">Number of comments</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${ bugs }" var="instance">
                      <tr>
                         
                              <th scope="row">${instance.id}</th>
                              <td>${instance.errorCode}</td>
                            
                          
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
            </div>
        </div>

        <div class="col-lg-3">
            <a href="favoriteBugs" class="btn btn-primary">All my favorite Bugs</a>
            <hr>
            <a href="solvedBugs" class="btn btn-primary">All my solved Bugs</a>
            <hr>
            <a href="bugsISolved">All the Bugs I have solved</a>
        </div>

    </div>
    
</body>
</html>