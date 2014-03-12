<link id="style_link" rel=StyleSheet href="include/vf1-1024x768.css" type="text/css" media=all />
<table class=table3 width="250" border="0" align="center" valign="center" cellpadding="0" cellspacing="1" bgcolor="#111166">
<h3 class =h3> VF1-DAMP System </h3>
<tr>
<form name="form1" method="post" action="checklogin.php">
<td>
<table class=table4>
<tr>
<td colspan="3"><strong>Member Login </strong></td>
</tr>
<tr>
<div style="display:table;height:0px;text-align:center;">
<div style="display:table-cell;vertical-align:middle;">
<td width="78">Username</td>
<td width="6">:</td>
<td width="294"><input name="myusername" type="text" id="myusername"></td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input name="mypassword" type="password" id="mypassword"></td>
</tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Login"></td>
</div>
</div>
</form>
</table>
</form>
</table>

<?php

function showAlert()
	{
		echo "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=index.php'>
        <script type=\"text/javascript\">
        alert(\"Username or password is wrong!\");
        </script>";
	}
	
?>
