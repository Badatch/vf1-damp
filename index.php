<link id="style_link" rel=StyleSheet href="include/vf1-1024x768.css" type="text/css" media=all />
<body class="loginpage">
<h3> VF1-DAMP System Login </h3>

<div id="container">       
<form name="form1" method="post" action="checklogin.php">

<label class="label1" for="username">Username:</label>
<input class = "usernamefield" type="text" id="username" name="myusername">

<label class="label1" for="password">Password:</label>
<input class = "passwordfield" type="password" id="password" name="mypassword">

<div id="lower">
<td>&nbsp;</td>
<td>&nbsp;</td>
<input class="loginbutton" type="submit" value="Login">
</div><!--/ lower-->
</form>
</div>
</body>


<?php

function showAlert()
	{
		echo "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=index.php'>
        <script type=\"text/javascript\">
        alert(\"Username or password is wrong!\");
        </script>";
	}
	
?>
