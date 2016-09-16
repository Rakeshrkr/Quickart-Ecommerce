<%@ include file="Common-Header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div class="container">
			<form:errors path="user.*"/>   <!-- action = "/quickart/RegistrationSuccess" -->
            <form:form action = "addUser" method = "post" class="form-horizontal" role="form" commandLine = "User"/>
                <h2>Sign Up </h2>
                
                <div class="form-group">
                    <form:label path="fullName" for="fullName" class="col-sm-3 form-control">Full Name</form:label>
                    <div class="col-sm-9">
                        <form:input  type="text" path="fullName"  name="fullName" placeholder="eg: Rakesh Kumar" class="form-control" />
               		</div>
                </div>
                <div class="form-group">
                    <form:label for="email" path="email" class="col-sm-3 control-label">Email</form:label>
                    <div class="col-sm-9">
                        <form:input path="email" type="text" name="email" placeholder="Email" class="form-control"/>
                    </div>
                </div>
                 <div class="form-group">
                    <form:label path="mobilenumber" for="mobilenumber" class="col-sm-3 control-label">Mobile No.</form:label>
                    <div class="col-sm-9">
                        <form:input path="mobilenumber" type="number" name="mobilenumber" placeholder="9967452030" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="password" for="password" class="col-sm-3 control-label">Password</form:label>
                    <div class="col-sm-9">
                        <form:input path="password" type="password" name="password" placeholder="Password" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="birthDate" for="birthDate" class="col-sm-3 control-label">Date of Birth</form:label>
                    <div class="col-sm-9">
                        <form:input path="birthDate" type="text" name="birthDate" placeholder="dd/mm/yyyy" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="country" for="country" class="col-sm-3 control-label">Country</form:label>
                    <div class="col-sm-9">
                        <form:select path="country" name="country" class="form-control">
                        	<option>India</option>
                            <option>Afghanistan</option>
                            <option>Pakistan</option>
                            <option>China</option>
                            <option>Bangladesh</option>
                            <option>United State of America</option>
                            <option>Nepal</option>
                            <option>Japan</option>
                            <option>Phillipins</option>
                        </form:select>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <form:label path="gender" class="control-label col-sm-3">Gender</form:label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" name="gender" value="Female"/>Female
                                </form:label>
                            </div>
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" name="gender" value="Male"/>Male
                                </form:label>
                            </div>
                            <div class="col-sm-4">
                                <form:label path="gender" class="radio-inline">
                                    <form:input path="gender" type="radio" name="gender" value="Unknown"/>Unknown
                                </form:label>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">I accept <a href="#">terms and conditions</a>
                            </label>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <form:button type="submit" class="btn btn-primary btn-block">Register</form:button>
                    </div>
                </div>
                    </form> <!-- /form -->
        </div> <!-- ./container -->


<%@ include file="Common-Footer.jsp" %>