<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<!-- need to import user,bug instance onto this jsp: LM MS-->
	<jsp:include page="navbar.jsp" />

	<div class="container">

		<form class="ajax_post" endpoint="/bugs/step" insert="#step">
			<label>Step</label>
			<textarea name="description"></textarea>
			<input type="hidden" name="bugId" value="${bug.getId()}">
			<input type="submit"/>
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
       
			<div id="step">
				<c:forEach items="${bug.getSteps() }" var="step">
				<p>${step.getDescription()}</p>
				<p>${step.getCreatedAt() }</p>
				</c:forEach>
			</div>


				<form class="ajax_post" endpoint="/comment" insert="#comment">
					<label>Comment</label>
					<textarea name="content"></textarea>
					<input type="hidden" name="bug" value="${bug.getId()}">
					<input type="hidden" name="commentor" value="${userId}">
					<input type="submit" />
				</form>

				<div id="comment">
					<c:forEach items="${comments }" var="comment">
						<p>${comment.getContent()}</p>
						<p>${comment.getCreatedAt() }</p>
					</c:forEach>
				</div>



		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function () {
		$(document).on("submit", ".ajax_post", function (event) {
			event.preventDefault();
			console.log("rabble");
			data = $(this).serialize();
			console.log(data);
			url = $(this).attr("endpoint")
			insert = $(this).attr("insert")
			$.ajax({
				type: "POST",
				url: url,
				data: data,
				success: function (serverResponse) {
					console.log(serverResponse);
					$(insert).append(serverResponse);
					$(".ajax_post").trigger("reset");
				}
			})
		})
		$(document).on("submit", ".ajax_search", function (event) {
			event.preventDefault();
			data = $(this).serialize();
			$.ajax({
				type:"POST",
				url: "/search",
				data: data,
				success: function (serverResponse){
					console.log(serverResponse)
					$("#search_insert").append(serverResponse);
					$(".ajax_search").trigger("reset");
					}
				})
			})
	})



</script>

</html>