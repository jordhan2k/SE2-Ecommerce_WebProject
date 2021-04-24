<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>


<aside class="customer-sidebar">
        <div class="container-fluid">
           
            <h2>USENAME</h2>
        </div>
        <ul class="list-group list-group-flush">




            <li id="acc-detail" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/profile"><div><i class="fas fa-user-circle"></i></div>Account details</a></li>
         
            <li id="acc-password" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/password"><div><i class="fas fa-key"></i></div>Password</a></li>

            <li id="acc-address" class="list-group-item"><a href=""><div><i class="fas fa-map-marker-alt"></i></div>My address</a></li>

            <li id="acc-order" class="list-group-item"><a href=""><div><i class="fas fa-receipt"></i></i></div>Manage orders</a></li>

            <li id="acc-payment" class="list-group-item"><a href=""><div><i class="far fa-credit-card"></i></div>Payment methods</a></li>

            <li id="acc-voucher" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/voucher"><div><i class="fas fa-ticket-alt"></i></div>Vouchers</a></li>

            <li id="acc-qa" class="list-group-item"><a href=""><div><i class="fas fa-question-circle"></i></div>Q&A</a></li>
            
          </ul>
    </aside>