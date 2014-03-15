<?
	if ($here == "")
		{
?>

<div id="div2" class=div_mainpage>
	<p class="p1">Welcome to the <? echo $application_title; ?></p>
	<div class=div_image>
		<img src="./include/images/damp_stadium.png"/> 
		<span class="caption">From: <a href="http://www.fifa.com/worldcup/destination/stadiums/stadium=5007289/">Arena Amazonia - Manaus © LOC</a></span>
	</div>
</div>

<?
		}
?>

<?
	function post_update_message($pino,$classino)
	{
		echo "<p class=p_message>[".date('H:i:s')."] ".$classino." record (id = ".$pino.") has been updated!</p>";
	}
	
	function post_create_message($pino,$classino)
	{
		echo "<p class=p_message>[".date('H:i:s')."] ".$classino." new record (id = ".$pino.") has been created!</p>";
	}

?>
