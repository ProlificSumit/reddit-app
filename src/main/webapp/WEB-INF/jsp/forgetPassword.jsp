<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Schedule to Reddit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script th:src="@{/resources/validator.js}"></script>

<style type="text/css">
.btn.disabled{
background-color: #ddd;
border-color: #ddd;
}

.btn.disabled:hover{
background-color: #ddd;
border-color: #ddd;
}
</style>

</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./">Schedule to Reddit</a>
    </div>
    
     <p class="navbar-text navbar-right">
        <a href="./">Login</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    
  </div><!-- /.container-fluid -->
</nav>
<div class="container">
<h1>Forget password</h1>

<br/><br/>

<form class="form-horizontal col-sm-8" method="post" role="form" data-toggle="validator">
  <div class="form-group">
    <label for="email" class="col-sm-3 control-label">Email</label>
    <div class="col-sm-9">
      <input class="form-control" id="email" placeholder="Email" type="email" required="required"/>
    </div>
  </div>
  
  
  <div class="form-group">
    <div class="col-sm-3">&nbsp;</div>
    <div class="col-sm-3"><a href="./" class="btn btn-default">Cancel</a></div>
    <div class="col-sm-6">
      <button type="submit" id="submitBut" class="btn btn-primary pull-right">Send</button>
    </div>
  </div>
</form>
<script>
$("#submitBut").click(function(event) {
    event.preventDefault();
    forgetPassword();
});

function forgetPassword(){
	$.post("user/forgetPassword", {email: $("#email").val()}, function (data){
		window.location.href= "./";
	}).fail(function(error){
        console.log(error);
        alert("Error: "+ error.responseText);
    }); 
}
</script>
</div>		
</body>
</html>