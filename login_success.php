<?php
session_start();
if(!session_is_registered(myusername)){
header("location:index.php");
}
else if(session_is_registered(myusername)){
header("location:main_page.php");
}
?>

<html>
<body>
Login Successful
</body>
</html>