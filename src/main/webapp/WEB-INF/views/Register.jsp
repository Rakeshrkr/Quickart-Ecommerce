<%@ include file="Common-Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div class="container">
	<form:form class="form-horizontal" role="form"
		commandName="userDetails" method="post" action="addUser">
		<h2>Sign Up</h2>

		<div class="form-group">
			<form:label path="fullName" for="fullName"
				class="col-sm-3 control-label">Full Name</form:label>
			<div class="col-sm-9">
				<form:input path="fullName" type="text" id="fullName"
					placeholder="eg: Rakesh Kumar" class="form-control" />

			</div>
		</div>
		<div class="form-group">
			<form:label path="email" for="email" class="col-sm-3 control-label">Email</form:label>
			<div class="col-sm-9">
				<form:input path="email" type="email" id="email" placeholder="Email"
					class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<form:label path="userId" for="userId" class="col-sm-3 control-label">User Id</form:label>
			<div class="col-sm-9">
				<form:input path="userId" type="userId" id="userId" placeholder="userId"
					class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<form:label path="password" for="password"
				class="col-sm-3 control-label">Password</form:label>
			<div class="col-sm-9">
				<input type="password" id="password" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<form:label path="mobileNumber" for="mobileNumber"
				class="col-sm-3 control-label">Mobile No</form:label>
			<div class="col-sm-9">
				<form:input path="mobileNumber" type="text" id="mobileNumber"
					placeholder="9967452030" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<form:label path="dOB" for="dOB" class="col-sm-3 control-label">Date of Birth</form:label>
			<div class="col-sm-9">
				<form:input path="dOB" type="text" id="dOB" class="form-control"
					placeholder="yyyy-MM-dd" />
			</div>
		</div>
		<div class="form-group">
			<form:label path="address" for="address"
				class="col-sm-3 control-label">Address</form:label>
			<div class="col-sm-9">
				<form:input path="address" type="text" id="address"
					class="form-control" placeholder="Address" />
			</div>
		</div>

		<%--   <div class="form-group">
                    <form:label path="gender" class="control-label col-sm-3">Gender</form:label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" id="femaleRadio" value="Female"/>Female
                                </form:label>
                            </div>
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" id="maleRadio" value="Male"/>Male
                                </form:label>
                            </div>
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" id="uncknownRadio" value="Unknown"/>Third Gender
                                </form:label>
                            </div>
                        </div>
                    </div> --%>

		<!-- /.form-group -->

		<div class="form-group">
			<div class="col-sm-9 col-sm-offset-3">
				<div class="checkbox">
					<label> <input type="checkbox">I accept <a href="#">terms
							and conditions</a>
					</label>
				</div>
			</div>
		</div>
		<!-- /.form-group -->
		<div class="form-group">
			<div class="col-sm-9 col-sm-offset-3">
				<form:button type="submit" class="btn btn-primary btn-block">Register</form:button>
			</div>
		</div>

	</form:form>
</div>

<!-- ./container -->

<hr>
<hr>
<hr>
<hr>

<%@ include file="Common-Footer.jsp"%>