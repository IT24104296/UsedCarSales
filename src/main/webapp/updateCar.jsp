<%--
  Created by IntelliJ IDEA.
  User: Vahinthan
  Date: 5/21/2025
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Update Car</title></head>
<body>
<h2>Update Car</h2>
<form action="updateCar" method="post">
  <input type="hidden" name="id" value="${car.id}" />
  Make: <input type="text" name="make" value="${car.make}" required /><br/>
  Model: <input type="text" name="model" value="${car.model}" required /><br/>
  Year: <input type="number" name="year" value="${car.year}" required /><br/>
  <input type="submit" value="Update Car"/>
</form>
<br><a href="listCars.jsp">Back to Car List</a>
</body>
</html>
