<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<p>${comment.commentor.name} says -</p>
<p>
    ${comment.getContent()}
</p>
<p>
    ${comment.getCreatedAt()}
</p>