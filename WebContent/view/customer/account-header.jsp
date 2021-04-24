<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<header class="container-fluid">
  <nav class="navbar navbar-expand-md   navbar-dark sticky-top" style="background-color: #d03737;">
    <div class="container">
    <a class="navbar-brand" href="#">
        <img src="${url }images/account-brand.png" width="50px" alt="">
        <img src="${url }images/brand-light.png" height="50px" alt="">
    </a>

    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
    </ul>
   </div>
  </nav>
</header>