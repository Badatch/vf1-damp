<?  include 'main_page_customization.php'; ?>

<?
		foreach ($classes as $class_key => $class_value)
		{
			if($here == $class_value)
			{
?>

<div id="div2" class=div_mainpage>

<? 

// let's create a context sensitive sub menu for each class of the system

				if ($mode == "" || $mode == "confirm_update")
				{
					echo "<p class='p1'>".$class_value.": 
					<a href='". $current_file_name."?here=".$class_value."&mode=create&class_obj=".$class_value."'>create new ".$class_value."</a> |  
					<a href='". $current_file_name."?here=".$class_value."&mode=search&class_obj=".$class_value."'>search ".$class_value."</a> |
					<a href='". $current_file_name."?here=".$class_value."&mode=delete&class_obj=".$class_value."'>delete ".$class_value."</a>
					</p>";
				}
				else if ($mode == "create" || $mode == "confirm_create" )
				{
					echo "<p class='p1'>
					<a href='". $current_file_name."?here=".$class_value."&class_obj=".$class_value."'>".$class_value."</a>: create new ".$class_value." | 
					<a href='". $current_file_name."?here=".$class_value."&mode=search&class_obj=".$class_value."'>search ".$class_value."</a> |
					<a href='". $current_file_name."?here=".$class_value."&mode=delete&class_obj=".$class_value."'>delete ".$class_value."</a>
					
					</p>";
				}
				else if ($mode == "search" || $mode == "confirm_search")
				{
					echo "<p class='p1'>
					<a href='". $current_file_name."?here=".$class_value."&class_obj=".$class_value."'>".$class_value."</a>: 
					<a href='". $current_file_name."?here=".$class_value."&mode=create&class_obj=".$class_value."'>create new ".$class_value."</a> | search ".$class_value." |
					<a href='". $current_file_name."?here=".$class_value."&mode=delete&class_obj=".$class_value."'>delete ".$class_value."</a> 
					</p>";
				}
				else if ($mode == "update")
				{
					echo "<p class='p1'>
					<a href='". $current_file_name."?here=".$class_value."&class_obj=".$class_value."'>".$class_value."</a>: 
					<a href='". $current_file_name."?here=".$class_value."&mode=create&class_obj=".$class_value."'>create new ".$class_value."</a> |
					<a href='". $current_file_name."?here=".$class_value."&mode=search&class_obj=".$class_value."'>search ".$class_value."</a> |
					<a href='". $current_file_name."?here=".$class_value."&mode=delete&class_obj=".$class_value."'>delete ".$class_value."</a> 
					</p>";
				}
				else if ($mode == "delete" || $mode == "confirm_delete")
				{
					echo "<p class='p1'>
					<a href='". $current_file_name."?here=".$class_value."&class_obj=".$class_value."'>".$class_value."</a>: 
					<a href='". $current_file_name."?here=".$class_value."&mode=create&class_obj=".$class_value."'>create new ".$class_value."</a> | 
					<a href='". $current_file_name."?here=".$class_value."&mode=search&class_obj=".$class_value."'>search ".$class_value."</a> |
					<a href='". $current_file_name."?here=".$class_value."&mode=delete&class_obj=".$class_value."'>delete ".$class_value."</a>   
					</p>";
				}
			}
		}
	

	
	
?>	
