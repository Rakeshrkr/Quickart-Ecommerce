<%@ include file="Common-Header.jsp"%>
<div style="text-align: center "  ><font color="red">${errorMessage}</font> </div>
<br>
<!--Login form start from here-->
<div class="container" >
	<div class="row" align="center">
		<div class="col-sm-6 col-md-4 col-md-offset-4">
			<div class="account-wall">
				<form name="login" value="j_spring_security_check" class="form-signin" method="post" >
					<input type="text" name ="name" class="form-control" placeholder="User Name"
						required autofocus >
					<input type="password" name="password"
						class="form-control" placeholder="Password" required>
					<button class="btn btn-lg btn-primary btn-block" type="submit">
						Sign in</button>
					<label class="checkbox pull-right"> <input type="checkbox"
						value="remember-me"> Remember me
					</label> <a href="#" class="pull-left need-help">Need help? </a><span
						class="clearfix"></span>
					<input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
			<a href="Register" class="text-center new-account">Create an
				account </a>
		</div>
	</div>
</div>
<!--Login form ends here-->


<%@ include file="Common-Footer.jsp"%>