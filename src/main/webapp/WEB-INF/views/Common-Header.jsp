<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset='utf-8' />
<title>Quickart</title>
<meta name="viewport" content="width-divice-width,initial-scale-1.0">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link href="<c:url value="/css/MyStyleSheet.css" />" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body data-spy="scroll" data-target="#my-navbar">
	<!--navbar-->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse">
				<!--navbar toggle button start-->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<!--navbar toggle button ends-->
			<b><a href="index" class="navbar-brand">Quickart</a></b>
		</div>
		<!--navbar header ends-->
		<div class="collapse nav nav-collapse navbar-collapse"
			id="navbar-collapse">
			<!--navbar collapse items-->
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: white" href="" id="cart"> <span
						class="glyphicon glyphicon-shopping-cart"></span>Cart<span
						class="badge">0</span></a></li>
				<li><a href="ContactUs"><span
						class="glyphicon glyphicon-earphone"></span> Contact Us</a></li>

				<c:choose>
					<c:when test="${user==null}">
						<li><a href="Register"><span
								class="glyphicon glyphicon-user" id="signupbutton"></span> Sign
								Up</a></li>
						<li><a href="Login"><span
								class="glyphicon glyphicon-log-in" id="loginbutton"></span>
								Login</a></li>
					</c:when>
					<c:otherwise>
						<%-- <li><a href="index"><span
								class="glyphicon glyphicon-log-out" id="logoutbutton"></span>
								${user}</a></li> --%>
						<li>
						<li class="dropdown dropdown clearfix"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								${user}<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="logout">LogOut</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul style="font-size: 0.9vw" class="nav navbar-nav">
				<li><a href="/quickart">Home</a> 
				<li><a href="/quickart">Gallary</a>
				<li><a href="/quickart">Shopping</a>
				<li><a href="/quickart">About Us</a>
			</ul>


		</div>
		<!--navbar collapse items ends-->
	</div>
	<!--end container--> </nav>
	<!--navbar end-->


	<div class="jumbotron" id="home">
		<!--Jumbotron starts from here-->
		<div class="container text-center" id="home-container">
			<div class="row">
				<div class="col-md-4">
					<img src="<c:url value="/images/Quickart.jpg"></c:url>"
						alt="Quickartlogo" />
				</div>
				<div class="col-md-8">
					<h1>Quickart</h1>
					<p>Find and buy everything you need - Cloths, electronics and
						many more</p>
					<div class="btn-group">
						<a href="" class="btn btn-primary">Download App</a> <a
							href="#shopping" class="btn btn-info">Visit Store</a> <a href=""
							class="btn btn-primary"> Spread the word</a>
					</div>
				</div>
			</div>
		</div>
		<!--container ends-->
	</div>
	<!--jumbotron ends -->