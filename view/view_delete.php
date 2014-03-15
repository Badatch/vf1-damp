<?

	$class_obj=$_REQUEST['class_obj'];
	
	echo "<p class='p1'>delete new ".$class_obj."</p>";
	if (isset($_REQUEST['post_delete']))
	{
		post_delete_message($_REQUEST['post_delete'],$class_obj);
	}
	
	
	echo "<table class=table1 float:right><form id=form_delete action=".$current_file_name."?here=".$here."&mode=confirm_delete&class_obj=".$class_obj." method=post>";
	
	$w_columns = MyActiveRecord::Columns($class_obj);
	echo "<tr><td>id<td><input type=text id='input_id' name='input_id' value=''>";

	foreach ($join_tables as $jt_key => $jt_value)
	{
		$pos = strpos($jt_value,$here);
		if($pos === false) {
						// string needle NOT found in haystack
		}
		else {		// string needle found in haystack
						
			$there = str_replace("_","",$jt_value);
			$there = str_replace($here,"",$there);

			include "view_displayjt.php";
		}
	}
	
	
	echo "<tr><td><td><input type=button value='delete new ".$here."' onClick=javascript:confirm_delete('delete_id');><td><input type=reset >";
	echo "</table></form>";
	
?>
