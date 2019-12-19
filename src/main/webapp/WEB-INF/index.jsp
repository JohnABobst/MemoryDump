<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Mon Sep 12 2016 06:42:47 GMT+0000 (UTC) -->
<html data-wf-domain="evermore-template.webflow.io"
	data-wf-page="56d0c9f9db0bfb1112107afc"
	data-wf-site="56d0c9f9db0bfb1112107afe">

<head>
<meta charset="utf-8">
<title>Blog Home</title>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link
	href="https://daks2k3a4ib2z.cloudfront.net/56d0c9f9db0bfb1112107afe/css/evermore-template.webflow.79e76dda8.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
<script type="text/javascript">
	WebFont
			.load({
				google : {
					families : [
							"Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic",
							"Merriweather:300,400,700,900",
							"Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic",
							"Lora:regular,italic" ]
				}
			});
</script>
<script
	src="https://daks2k3a4ib2z.cloudfront.net/0globals/modernizr-2.7.1.js"
	type="text/javascript"></script>
<link href="https://daks2k3a4ib2z.cloudfront.net/img/favicon.ico"
	rel="shortcut icon" type="image/x-icon">
<link href="https://daks2k3a4ib2z.cloudfront.net/img/webclip.png"
	rel="apple-touch-icon">
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(window).on('load', function() {
		$('.preloader').addClass('complete')
	})
</script>

</head>

<body>


	<jsp:include page="navbar.jsp" />

	<div class="preloader">
		<div class="loader"></div>
	</div>


    <div class="content-wrapper">
        <div class="w-container">
            <div class="w-dyn-list">
                <div class="w-dyn-items">
                    <c:forEach items="${ bugs }" var="instance">
                        <div class="w-dyn-item">
                            <div class="post-wrapper">
                                <a class="blog-title-link w-inline-block"
                                    href="/posts/cafe-au-lait-turkish-doppio-ristretto">
                                    <h1 class="blog-title">${ instance.errorCode }</h1>
                                </a>
                                <div class="post-info-wrapper">
                                    <div class="post-info">
                                        ${ instance.createdAt } | Placeholder for tech stuff</div>
                                    <!-- <div class="post-info">|</div><a class="post-info when-link"
                                        href="">PlaceHoler for list of techo</a>
                                </div> -->
                                    <p class="post-summary">${ instance.additionalDetails }</p><a
                                        class="button-round w-button" href="/bugs/${ instance.id }">Go To Bug
                                        Details</a>
                                </div>
                            </div>
                    </c:forEach>

                </div>
            </div>
            <div class="button-wrapper"><a class="button w-button" href="/all-posts">More posts&nbsp;→</a></div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />

</body>

<script>
    $(document).ready(function () {
        
        setTimeout(function() {
        $('.loader').removeClass('loader');
        }, 925);
    });
</script>

</html>