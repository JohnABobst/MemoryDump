<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<jsp:include page="navbar.jsp" />
<style>
.inlineB {
	display: inline-block;
	vertical-align: top;
}

.padMe {
	text-align: center;
}

.rightSide {
	width: 60%;
	padding-right: 40px;
}

li {
	display: inline-block;
	margin: 0 8px;
}

.submit {
	margin-bottom: 15px;
	vertical-align: top;
	background-color: #18A999;
}

.ourYellow {
	background-color: #E6C97A;
}

#header {
	background-image: url("../images/heroImageRoseGold.jfif");
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.w-dyn-list {
	text-align: left;
	padding-left: 50px;
}

hr {
	border: .5px solid rgb(211, 211, 211);
}
.stickyT{
	position: -webkit-sticky;
  	position: sticky;
  	top: 0;

}

</style>

<div class="content-wrapper">
	<div class="w-container">
		<div class="post-wrapper">
			<h1 style="display: inline-block; margin-right: 8px;">${bug.errorCode}</h1>
			<span> <a href="/bugs/${bug.id}/bookmark"> Bookmark </a> | <c:if
					test="${ bug.creator.id == user.id }">
					<a href="/bugs/${bug.id}/solved"> Solved </a>
				</c:if>
			</span>
			<ul>
				<c:forEach items="${bug.getTechnologies()}" var="tech">
					<li>
						<p>${tech.name}${tech.version}</p>
					</li>
				</c:forEach>

			</ul>

			<h6>Error Details</h6>
			<div class="body-copy blockquote">${bug.additionalDetails}</div>
			<h6>Created on ${ bug.getCreatedAt()}</h6>

		</div>

		<div class="padMe">
			<div class="w-dyn-list inlineB stickyT">

				<form class="ajax_post" endpoint="/bugs/step" insert="#step">
					<label>Step</label>
					<textarea name="description"></textarea>
					<input type="hidden" name="bugId" value="${bug.getId()}"> <input
						class="submit social-button ourYellow" type="submit" />
				</form>
			
				<form class="ajax_post" endpoint="/comment" insert="#comment">
					<label>Comment</label>
					<textarea name="content"></textarea>
					<input type="hidden" name="bug" value="${bug.getId()}"> <input
						type="hidden" name="commentor" value="${userId}"> <input
						class="submit social-button ourYellow" type="submit" />
				</form>
			



			</div>
			<div class="w-dyn-list inlineB rightSide">

				<c:if test="${bug.creator.id == user.id }">
				<h4>Steps</h4>
				<div id="step">
					<c:forEach items="${bug.getSteps() }" var="step">
						<p>${step.getDescription()}</p>
						<p>${step.getCreatedAt() }</p>
					</c:forEach>
				</div>
				<hr>
				</c:if>
				<h4>Comments</h4>
				<div id="comment">
					<c:forEach items="${ comments }" var="comment">
					<p>${comment.commentor.name} says -</p>
						<p>${comment.content}</p>
						<p>${comment.createdAt }</p>
					</c:forEach>
				</div>


			</div>
		</div>

	</div>
</div>
<jsp:include page="footer.jsp" />
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("submit", ".ajax_post", function(event) {
			event.preventDefault();
			console.log("rabble");
			data = $(this).serialize();
			console.log(data);
			url = $(this).attr("endpoint")
			insert = $(this).attr("insert")
			$.ajax({
				type : "POST",
				url : url,
				data : data,
				success : function(serverResponse) {

					$(insert).append(serverResponse);
					$(".ajax_post").trigger("reset");
				}
			})
		})
		$(document).on("submit", ".ajax_search", function(event) {
			event.preventDefault();
			data = $(this).serialize();
			$.ajax({
				type : "POST",
				url : "/search",
				data : data,
				success : function(serverResponse) {
					console.log(serverResponse)

					$("#search_insert").append(serverResponse);
					$(".ajax_search").trigger("reset");
				}
			})
		})
		$("form").remove(".ajax_search");

	})
</script>

</html>