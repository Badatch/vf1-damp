<?php

$hostname="localhost";
$username="root"; 
$password="";
$dbname="damp"; 
$tbl_name="login";

mysql_connect("$hostname", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$dbname")or die("cannot select DB");

$myusername=$_POST['myusername']; 
$mypassword=$_POST['mypassword']; 


$sql="SELECT * FROM $tbl_name WHERE username='$myusername' and password='$mypassword'";
$result=mysql_query($sql);

$count=mysql_num_rows($result);

if($count==1){

session_register("myusername");
session_register("mypassword"); 
header("location:login_success.php");
}
else {

	include'index.php';
    showAlert();

}
?>
