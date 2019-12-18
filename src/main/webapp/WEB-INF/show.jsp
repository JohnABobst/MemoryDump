<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Display Bug</title>
</head>

<body>

    <!-- need to import user,bug instance onto this jsp: LM MS-->
    <jsp:include page="navbar.jsp" />

    <div class="container">

		<form class="ajax_post">
		<label>Step</label>
		<textarea name="description" ></textarea>
		<input type="hidden" name="bugId" value="${bug.getId() }">
		<input type="submit" value="Add Step">
		</form>
        <div class="row justify-content-around pt-5">

            <div class="row-justify-content-center">
                <h1>${ bug.getErrorCode() }</h1>
            </div>

            <div class="row row-justify-content-between">
                <h6>Created on ${ bug.getCreatedAt()}</h6>
                <h6>Technologies</h6>
                <c:forEach items="${bug.getTechnologies() }" var="tech">
                	<p>${tech.getName()} ${tech.getVersion()}</p>
                </c:forEach>
               
            </div>
			<div id="insert">
			
			</div>

         




</div>
    </div>

</body>
 <script type="text/javascript">
	$(document).ready(function(){
		$(document).on("submit", ".ajax_post", function(event){
			console.log("Working?");
			event.preventDefault();
			data = $(this).serialize();
			$.ajax({
				type:"POST",
				url: "/bugs/step",
				data: data,
				success: function (serverResponse){
					$("#insert").append(serverResponse);
					
					}
					})
			})
		})
		
		

	</script>
</html>