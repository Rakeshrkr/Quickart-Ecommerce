<%@ include file="Common-Header.jsp" %>
<div class="container">
			<form:errors path="user.*"/>
            <form action = "/quickart/RegistrationSuccess" method = "post" class="form-horizontal" role="form">
                <h2>Sign Up </h2>
                
                <div class="form-group">
                    <label for="fullName" class="col-sm-3 control-label">Full Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="fullName" placeholder="eg: Rakesh Kumar" class="form-control" autofocus>
                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="text" name="email" placeholder="Email" class="form-control">
                    </div>
                </div>
                 <div class="form-group">
                    <label for="mobilenumber" class="col-sm-3 control-label">Mobile No.</label>
                    <div class="col-sm-9">
                        <input type="number" name="mobilenumber" placeholder="9967452030" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" name="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="text" name="birthDate" placeholder="dd/mm/yyyy" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="col-sm-3 control-label">Country</label>
                    <div class="col-sm-9">
                        <select name="country" class="form-control">
                        	<option>India</option>
                            <option>Afghanistan</option>
                            <option>Pakistan</option>
                            <option>China</option>
                            <option>Bangladesh</option>
                            <option>United State of America</option>
                            <option>Nepal</option>
                            <option>Japan</option>
                            <option>Phillipins</option>
                        </select>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="Female">Female
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="Male">Male
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="Unknown">Unknown
                                </label>
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
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </div>
                </div>
                    </form> <!-- /form -->
        </div> <!-- ./container -->


<%@ include file="Common-Footer.jsp" %>