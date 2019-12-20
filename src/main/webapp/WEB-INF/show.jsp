<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html data-wf-domain="evermore-template.webflow.io" data-wf-page="56d0c9f9db0bfb1112107afc"
	data-wf-site="56d0c9f9db0bfb1112107afe">

<head>
	<meta charset="utf-8">
	<title>Blog Home</title>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	<link
		href="https://daks2k3a4ib2z.cloudfront.net/56d0c9f9db0bfb1112107afe/css/evermore-template.webflow.79e76dda8.css"
		rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
	<script type="text/javascript">WebFont.load({
			google: {
				families: ["Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic", "Merriweather:300,400,700,900", "Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic", "Lora:regular,italic"]
			}
		});</script>
	<script src="https://daks2k3a4ib2z.cloudfront.net/0globals/modernizr-2.7.1.js" type="text/javascript"></script>
	<link href="https://daks2k3a4ib2z.cloudfront.net/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
	<link href="https://daks2k3a4ib2z.cloudfront.net/img/webclip.png" rel="apple-touch-icon">
	<link rel="stylesheet" type="text/css" href="css/navbar.css">

	<style>
		* {
			outline: 1px dotted red;
		}

		.inlineB {
			display: inline-block;
			vertical-align: top;
		}

		.padMe {
			text-align: center;
		}

		.rightSide {
			width: 60%;
		}

		.text-left {
			text-align: left;
		}

		li {
			text-align: left;
		}

		#header {
			background-image: url("../images/heroImageRoseGold.jfif");
			background-attachment: fixed;
			background-position: center;
			background-repeat: no-repeat;
			background-size: cover;
		}

		.stickyStuff {
			position: -webkit-sticky;
			position: sticky;
			top: 0;
		}
	</style>

</head>

<body>

	<header class="header-section" id="header">
		<div class="w-container">
			<a class="main-title" href="/">Memory Dump</a>
			<p class="main-subheading">A place to dump all your problems and questions with super specific error codes
			</p>
			<div>
				<div class="dropdown-wrapper w-dropdown" data-delay="0">
					<div class="dropdown-menu w-dropdown-toggle">
						<img class="menu-icon" height="12"
							src="http://uploads.webflow.com/56d0c9f9db0bfb1112107afe/56d0fee6e867b1c137682a4e_menu.svg"
							width="12">
						<div class="menu-text">Menu</div>
					</div>
					<nav class="menu-list w-dropdown-list">
						<a class="home menu-
              link w-dropdown-link" href="/logReg">Login/Reg</a>

						<a href="/logout" class="menu-
                link w-dropdown-link"> Logout</a>

						<a class="menu-link w-dropdown-link" href="/dashboard">Dashboard</a>
						<a class="menu-link w-dropdown-link" href="/about">About</a>
						<a class="menu-link w-dropdown-link" href="/contact">Contact</a>
					</nav>
				</div>


			</div>
		</div>
	</header>

	<div class="content-wrapper">
		<div class="w-container">
			<div class="post-wrapper">
				<h1>${bug.errorCode}</h1>
				<ul>
					<c:forEach items="${bug.technologies}" var="tech">
						<li>
							<p>${tech.name} ${tech.version}</p>
						</li>
					</c:forEach>

				</ul>
				<h6>Created on ${ bug.getCreatedAt()}</h6>

				<a href="/bugs/${bug.id}/bookmark"> Bookmark </a> |
				<c:if test="${ bug.creator.id == user.id }">
					<a href="/bugs/${bug.id}/solved"> Solved </a>
				</c:if>
			</div>

			<div class="padMe">
				<div class="w-dyn-list inlineB stickyStuff">


					<c:if test="${bug.creator.id == userId}">

						<form class="ajax_post" endpoint="/bugs/step" insert="#step">
							<label>
								<h3>
									Steps tried
								</h3>
							</label>
							<textarea name="description"></textarea>
							<input type="hidden" name="bugId" value="${bug.getId()}">

							<input type="submit" class="social-button ourYellow pink" />
						</form>
					</c:if>
					<form class="ajax_post" endpoint="/comment" insert="#comment">
						<label>
							<h3>Add a comment</h3>
						</label>
						<textarea name="content"></textarea>
						<input type="hidden" name="bug" value="${bug.getId()}">
						<input type="hidden" name="commentor" value="${userId}">
						<input type="submit" class="social-button ourYellow pink" />
					</form>


				</div>
				<div class="w-dyn-list inlineB rightSide">
					<h4>Details </h4>
					<div class="body-copy blockquote">
						${bug.additionalDetails}
					</div>

					<h4>Steps Taken</h4>

					<div id="step">
						<ol>
							<c:forEach items="${bug.getSteps() }" var="step">
								<li>
									${step.getDescription()}
									${step.getCreatedAt() }
								</li>
							</c:forEach>
						</ol>

					</div>
					<h4>Comments</h4>
					<div class="w-dny-list">
						<div class="w-dny-items" id="comment">
							<c:forEach items="${ comments }" var="comment">
								<div class="w-dny-item">
									<div class="post-wrapper  text-left">
										<div class="w-inline-block">
											<div class="blog-title">
												<h6>
													${comment.commentor.name}
												</h6>
											</div>
										</div>
										<div class="post-info-wrapper">
											<div class="post-info">
												${comment.createdAt}
											</div>

											<div class="post-summary  text-left">
												${comment.content}

											</div>
										</div>

									</div>
								</div>
							</c:forEach>

						</div>
					</div>


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
				type: "POST",
				url: "/search",
				data: data,
				success: function (serverResponse) {
					console.log(serverResponse)
					$("#search_insert").append(serverResponse);
					$(".ajax_search").trigger("reset");
				}
			})
		})
	})



</script>

</html>