<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <jsp:include page="navbar.jsp" />

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

</html>