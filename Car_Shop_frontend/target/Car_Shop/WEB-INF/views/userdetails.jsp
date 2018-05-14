<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<html>
<head>

</head>
<body>
<br>
<br>
<br>
<br>
<br>
	<div class="container">
  <h2>User Details</h2>
  <hr>
  <table class="table table-striped">
    
    <tbody>
      <tr>
        <td>Name:</td>
        <td>${user.name}</td>
      </tr>
      <tr>
        <td>Age:</td>
        <td>${user.age}</td>
      </tr>
      <tr>
        <td>Gender:</td>
        <td>${user.gender}</td>
      </tr>
      <tr>
        <td>Address:</td>
        <td>${user.address}</td>
      </tr>
      <tr>
        <td>Email:</td>
        <td>${user.emailId}</td>
       </tr>
      
    </tbody>
  </table>
  </div>
</body>

<%@include file="footer.jsp"%>
</html>