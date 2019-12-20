<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:forEach items="${ bugs }" var="bug">
    <div class="w-dyn-item">
        <div class="post-wrapper">
            <a class="blog-title-link w-inline-block" href="/bugs/${ bug.id }">
                <h1 class="blog-title">${ bug.errorCode }</h1>
            </a>
            <div class="post-info-wrapper">
                <div class="post-info">
                    ${ bug.createdAt } |
                    <c:forEach items="${ bug.getTechnologies() }" var="tech">
                        ${ tech.getName() } ${ tech.getVersion() } |
                    </c:forEach>

                </div>

                <p class="post-summary">${ bug.additionalDetails }</p><a class="button-round w-button"
                    href="/bugs/${ bug.id }">Go To Bug
                    Details</a>
            </div>
        </div>
</c:forEach>
