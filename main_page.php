<?
	include "model/model.php";
	
	// VF1 version 1.6
?>
<html>
<link id="style_link" rel=StyleSheet href="include/vf1-1024x768.css" type="text/css" media=all />
<link id="style_link" rel=StyleSheet href="include/calendar.css" type="text/css" media=all />
<script src="include/vf1.js"></script>
<script type="text/javascript" src="include/calendar.js"></script>

<title><? echo $application_title; ?></title>
<h2>

<form class = logoutbutton name="form1" method="post" action="logout.php">
<input type="submit" name="Submit" value="Logout"></form>

<form class = helpbutton name="form2" method="post" action="help.php">
<input type="submit" name="Submit" value="Help"></form>
<? echo $application_title; ?> </h2>

<?php
	session_start();
	if(!session_is_registered(myusername)){
		header("location:index.php");
	}
	function ReturnName()
	{
		//echo $current_file_name."<BR>";
		$cc = __FILE__;
		$cc_rev = strrev($cc);
		//echo "cc_rev = ".$cc_rev."<BR>";
		$c1 = "\\";
		$cc1 = strpos($cc_rev, $c1);
		//echo "cc1 = ".$cc1."<BR>";
		$cc2 = substr($cc_rev,0,$cc1);
		//echo "cc2 = ".$cc2."<BR>";
		$cc3 = strrev($cc2);
		return $cc3;
	}

	//echo ReturnName()."<BR>";
	$current_file_name = ReturnName();

	
	include "controller/controller.php";
	//include "model/model.php";
	
	
	function find_relatedclass($pino,$gino)
	{
		if(in_array($pino,$gino))
		{
			$prepino = substr($pino, 0, -3);
			$pos = strpos($prepino, "_");
			if (!($pos === false)) 
			{
				$prepino = substr($prepino, $pos+1);
			}
			return $prepino;
		}
	}
	
	
	
	//print_r($classes);
?>


</html>
