<?
	
	// The application title is defined here 
	$application_title = "VF1 v.1.6 - DAMP System";
	
	// The application database and the connection string are defined here
	// syntax is: 'username@database.server/database_name IDENTIFIED BY PASSWORD ' 
	define('MYACTIVERECORD_CONNECTION_STR', 'mysql://root@localhost/damp');
	
	// includes used implementation of MyActiveRecord class 
	include './include/MyActiveRecord.0.4.php';
	
	//in this array we list all and only those classes we like to CRUD manage from the main menu 
	$classes = array('card','delivery','driver', 'entrylog', 'supplier','vehicle', 'venue');  
	
	// in this array we list all join tables which hold many to many relationships between two given classes of objects
	$join_tables = array('card_driver');	
	
	// in this array below we list all foreign keys: this array MUST EXIST: if empty then uncomment line below (and comment the following one!)
	//foreign_keys=array();
	$foreign_keys = array('supplier_id', 'vehicle_id', 'venue_id', 'status_id', 'state_id', 'driver_id','title_id', 'delivery_venue_id', 'delivery_vehicle_id', 'delivery_driver_id', 'enter_id', 'delivery_id');
	
	// relationships between entities/classes are named below: if no name has
	// been given to a certain relationship, the bare foreign key would be displayed
	function name_child_relationship($class_name,$foreign_key)
	{
		if($class_name == 'vehicle' && $foreign_key == 'supplier_id')
		{
			return "supplier";
		}
		else if($class_name == 'vehicle' && $foreign_key == 'driver_id')
		{
			return "driver name";
		}
		else if($class_name == 'driver' && $foreign_key == 'supplier_id')
		{
			return "supplier";
		}
		else if($class_name == 'card' && $foreign_key == 'driver_id')
		{
			return "driver name";
		}
		else if($class_name == 'card' && $foreign_key == 'state_id')
		{
			return "card state";
		}
		else if($class_name == 'driver' && $foreign_key == 'title_id')
		{
			return "title";
		}
		else if($class_name == 'delivery' && $foreign_key == 'vehicle_id')
		{
			return "vehicle";
		}
		else if($class_name == 'delivery' && $foreign_key == 'driver_id')
		{
			return "driver";
		}
		else if($class_name == 'delivery' && $foreign_key == 'venue_id')
		{
			return "venue";
		}
		else if($class_name == 'entrylog' && $foreign_key == 'delivery_venue_id')
		{
			return "venue";
		}
		else if($class_name == 'entrylog' && $foreign_key == 'delivery_vehicle_id')
		{
			return "vehicle";
		}
		else if($class_name == 'entrylog' && $foreign_key == 'delivery_driver_id')
		{
			return "driver";
		}
		else if($class_name == 'entrylog' && $foreign_key == 'delivery_id')
		{
			return "delivery id";
		}
		else if($class_name == 'entrylog' && $foreign_key == 'enter_id')
		{
			return "delivery status";
		}
	}
	// this array has been initiated, but its usage will be defined in future versions of VF1
	$objects = array();
	
	// classes are defined below as extensions of MyActiveRecord class
		class vehicle extends MyActiveRecord{
			function destroy(){
			}	
		}
		class supplier extends MyActiveRecord{
			function destroy(){
			}	
		}	
		class delivery extends MyActiveRecord{
			function destroy(){
			}	
		}	
		class status extends MyActiveRecord{
			function destroy(){
			}	
		}	
		class venue extends MyActiveRecord{
			function destroy(){
			}	
		}	
		class driver extends MyActiveRecord{
			function destroy(){
			}	
		}
		class state extends MyActiveRecord{
			function destroy(){
			}
		}
		class card extends MyActiveRecord{
			function destroy(){
			}
		}
		class title extends MyActiveRecord{
			function destroy(){
			}
		}
		class entrylog extends MyActiveRecord{
			function destroy(){
			}
		}
		class enter extends MyActiveRecord{
			function destroy(){
			}
		}
?>
