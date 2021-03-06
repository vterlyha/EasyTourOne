<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Hotel info</title>
<link rel="stylesheet" href="resources/css/mainStyleSheet.css" />
</head>
<body>
	<jsp:include page="../jsp/fragments/header.jsp"></jsp:include>
	<%-- Displaying hotel data--%>
	<table class="UserTable" id="hotelTable">
		<tr>
			<th>Number</th>
			<th>Hotel</th>
			<th>City</th>
			<th>Country</th>
			<th>Room quantity</th>
			<th>Clients booked</th>
			<th>Average booking span</th>
		</tr>
		<c:forEach items="${generalHotels }" var="genHotel">
			<tr>
				<td>${genHotel.hotel.id }</td>
				<td>${genHotel.hotel.name}</td>
				<td>${genHotel.hotel.city.name }</td>
				<td>${genHotel.hotel.city.country.name }</td>
				<td>${genHotel.hotel.roomQuantity }</td>
				<td>${genHotel.numOfClients }</td>
				<td>${genHotel.avgStayLength }</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<%-- Adding new hotel--%>
	<form:form action="insertHotel" method="POST">
		<div class="UserDivs" id="addHotelDiv">
			<h3>Add hotel</h3>
			<p>Hotel name</p>
			<input type="text" name="hotelName"/>
			<p>Room quantity</p>
			<input type="text" name="hotelRoomQuantity"/>
			<p>City</p>
			<select class="UserSelect" name="cityValue">
				<option>--Cities--</option>
				<c:forEach items="${cities}" var="city">
					<option>${city.name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Add hotel">
		</div>
	</form:form>
	<br/>
	<%-- Adding new country--%>
	<form:form action="insertCountry" method="POST" modelAttribute="country">
		<div class="UserDivs" id="addCountryDiv">
			<h3>Add country</h3>
			<p>Country name</p>
			<input name="countryName" />
			<p>Visa required</p>
			<input type="checkbox" name="visaRequired" />
			<input type="submit" value="Add country">
		</div>
	</form:form>
	<%-- Adding new city --%>
	<form:form action="insertCity" method="POST">
		<div class="UserDivs" id="addCountryDiv">
			<h3>Add city</h3>
			<p>City name</p>
			<input name="cityName" />
			<p>Country</p>
			<select class="UserSelect" name="countryValue">
				<c:forEach items="${countries}" var="country">
					<option>${country.name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Add city">
		</div>
	</form:form>
</body>
</html>