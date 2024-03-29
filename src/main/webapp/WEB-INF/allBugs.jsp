<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>All Bugs</title>
</head>

<body>
  <!-- nav bar -->


  <jsp:include page="navbar.jsp" />


  <div class="container">

    <div class="row justify-content-around pt-5">



      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Problem</th>
            <th scope="col">Number of comments</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <c:forEach items="${ bugs }" var="instance">
              <th scope="row">${instance.id}</th>
              <td>${instance.errorCode}</td>
              <td>${instance.comments.length}</td>
            </c:forEach>
          </tr>
        </tbody>
      </table>

    </div>



  </div>




</body>

</html>