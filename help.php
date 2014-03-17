<link rel="shortcut icon" href="include/images/vf1_icon_big.ico" />
<link id="style_link" rel=StyleSheet href="include/vf1-1024x768.css" type="text/css" media=all />

<html>
<body class = "helpbod">
<h1 class = head2>Online Help</h1>

</html>

<div id='cssmenu'>
<ul>
   <li><a href='main_page.php'><span>Main Page</span></a></li>
   <li class='has-sub'><a href='help.php'><span>Create</span></a>
      <ul>
         <li><a href="#c_card"><span>Card</span></a></li>
         <li><a href="#c_delivery"><span>Delivery</span></a></li>
         <li><a href="#c_driver"><span>Driver</span></a></li>
         <li><a href="#c_entrylog"><span>Entry Log</span></a></li>
         <li><a href="#c_supplier"><span>Supplier</span></a></li>
         <li><a href="#c_vehicle"><span>Vehicle</span></a></li>
         <li class='last'><a href="#c_venue"><span>Venue</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='help.php'><span>Retrieve</span></a>
      <ul>
         <li><a href="#r_card"><span>Card</span></a></li>
         <li><a href="#r_delivery"><span>Delivery</span></a></li>
         <li><a href="#r_driver"><span>Driver</span></a></li>
         <li><a href="#r_entrylog"><span>Entry Log</span></a></li>
         <li><a href="#r_supplier"><span>Supplier</span></a></li>
         <li><a href="#r_vehicle"><span>Vehicle</span></a></li>
         <li class='last'><a href="#r_venue"><span>Venue</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='help.php'><span>Update</span></a>
      <ul>
         <li><a href="#u_card"><span>Card</span></a></li>
         <li><a href="#u_delivery"><span>Delivery</span></a></li>
         <li><a href="#u_driver"><span>Driver</span></a></li>
         <li><a href="#u_entrylog"><span>Entry Log</span></a></li>
         <li><a href="#u_supplier"><span>Supplier</span></a></li>
         <li><a href="#u_vehicle"><span>Vehicle</span></a></li>
         <li class='last'><a href="#u_venue"><span>Venue</span></a></li>
      </ul>
   </li>
   <li class='has-sub last'><a href='help.php'><span>Delete</span></a>
      <ul>
         <li><a href="#d_card"><span>Card</span></a></li>
         <li><a href="#d_delivery"><span>Delivery</span></a></li>
         <li><a href="#d_driver"><span>Driver</span></a></li>
         <li><a href="#d_entrylog"><span>Entry Log</span></a></li>
         <li><a href="#d_supplier"><span>Supplier</span></a></li>
         <li><a href="#d_vehicle"><span>Vehicle</span></a></li>
         <li class='last'><a href="#d_venue"><span>Venue</span></a></li>
      </ul>
   </li>
</ul>
</div>



<div class = helpinfo>

<h1><a name="c_card">Create Card</a></h1>
<p>Driver ID: Choose the driver from the drop down for whom you want to make a card for.</p>
<p>Start Date: Enter the date the card is valid from using yyyy-mm-dd format, or press the Set Date button to select a date from the calendar.</p>
<p>End Date: enter the expiry date of the card using yyyy-mm-dd format, or press the Set Date button to select a date from the calendar.</p>
<p>Card state: From the drop-down menu, select whether the card is "Valid", "Expired" or "Cancelled". A number represents the state.</p>
<p>Referred As: Enter the name of the driver who will be referred to with this card.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_card.png"/> 
</div>


<h1><a name="r_card">Retrieve Card</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-Driver ID</p>
<p>-Start Date</p>
<p>-End Date</p>
<p>-Card state</p>
<div class=help_pic>
<img src="./include/images/help_page/r_card.png"/> 
</div>


<h1><a name="u_card">Update Card</a></h1>
<p>Select the ID number of the card from the table to update the card with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_card.png"/> 
</div>


<h1><a name="d_card">Delete Card(Not yet implemented)</a></h1>
<p>Click the Delete option and enter the ID Number of the card to be deleted.</p>

<h1><a name="c_delivery">Create Delivery</a></h1>
<p>Venue ID: Select from the drop-down menu the venue to deliver the goods to.</p>
<p>Driver ID: Select from the drop-down menu the driver to use for this delivery.</p>
<p>Vehicle ID: Select from the drop-down menu the vehicle to use for this delivery.</p>
<p>Delivery Date: Enter a date or choose from the calender the date of the new delivery.</p>
<p>Referred As: Enter an identifier for this delivery.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_delivery.png"/> 
</div>

<h1><a name="r_delivery">Retrieve Delivery</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Vehicle ID</p>
<p>-Driver ID</p>
<p>-Delivery Date</p>
<div class=help_pic>
<img src="./include/images/help_page/r_delivery.png"/> 
</div>


<h1><a name="u_delivery">Update Delivery</a></h1>
<p>Select the ID number of the delivery from the table to update the delivery with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_delivery.png"/> 
</div>


<h1><a name="d_delivery">Delete Delivery (Not yet implemented)</a></h1>
<p>Enter the ID Number of the delivery to be deleted.</p>



<h1><a name="c_driver">Create Driver</a></h1>
<p>Title: Select from the drop-down menu their title.</p>
<p>Driver Name: Select from the drop-down menu the name of the driver.</p>
<p>Supplier ID: Select from the drop-down menu the supplier this driver will work for.</p>
<p>Referred As: Enter an identifier for this driver.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_driver.png"/> 
</div>


<h1><a name="r_driver">Retrieve Driver</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Title</p>
<p>-Driver Name</p>
<p>-Supplier</p>
<div class=help_pic>
<img src="./include/images/help_page/r_driver.png"/> 
</div>


<h1><a name="u_driver">Update Driver</a></h1>
<p>Select the ID number of the driver from the table to update the driver with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_driver.png"/> 
</div>


<h1><a name="d_driver">Delete Driver (Not yet implemented)</a></h1>
<p>Enter the ID Number of the driver to be deleted.</p>



<h1><a name="c_entrylog">Create EntyLog</a></h1>
<p>Delivery ID: Select from the drop-down menu a delivery.</p>
<p>Delivery Venue ID: Select from the drop-down menu a venue.</p>
<p>Delivery Vehicle ID: Select from the drop-down menu a vehicle.</p>
<p>Delivery Driver ID: Select from the drop-down menu a driver.</p>
<p>Delivery Status: Choose from the drop down the status of the delivery.</p>
<p>Referred As: Enter a number to easily refer to this supplier elsewhere in the system.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_entrylog.png"/> 
</div>


<h1><a name="r_entrylog">Retrieve EntyLog</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Delivery ID</p>
<p>-Delivery Venue ID</p>
<p>-Delivery Vehicle ID</p>
<p>-Delivery Driver ID</p>
<p>Enter ID</p>
<div class=help_pic>
<img src="./include/images/help_page/r_entrylog.png"/> 
</div>


<h1><a name="u_entrylog">Update EntyLog</a></h1>
<p>Select the ID number of the entry_log from the table to update the entry_log with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_entrylog.png"/> 
</div>


<h1><a name="d_entrylog">Delete EntyLog (Not yet implemented)</a></h1>
<p>Enter the ID Number of the entry_log to be deleted. (Or select the ID number from the table like update entry_log and bring up a pop-up box asking whether the user is sure if they want to delete this entry_log or not.)</p>

<h1><a name="c_supplier">Create Supplier</a></h1>
<p>Name: Enter the name of the driver.</p>
<p>Goods: The goods this supplier delivers.</p>
<p>Location: The location of the supplier.</p>
<p>Referred As: Enter a number to easily refer to this supplier elsewhere in the system.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_supplier.png"/> 
</div>

<h1><a name="r_supplier">Retrieve Supplier</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Name</p>
<p>-Name</p>
<p>-Goods</p>
<p>-Location</p>
<div class=help_pic>
<img src="./include/images/help_page/r_supplier.png"/> 
</div>


<h1><a name="u_supplier">Update Supplier</a></h1>
<p>Select the ID number of the Supplier from the table to update the Supplier with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_supplier.png"/> 
</div>


<h1><a name="d_supplier">Delete Supplier (Not yet implemented)</a></h1>
<p>Enter the ID Number of the Supplier to be deleted.</p>

<h1><a name="c_vehicle">Create Vehicle</a></h1>
<p>Reg No: Enter the registration number of the vehicle.</p>
<p>Make: Enter the make of the vehicle.</p>
<p>Model: Enter the model of the vehicle.</p>
<p>Supplier ID: Select from the drop-down menu the Supplier to associate this vehicle to.</p>
<p>Referred As: Select from the drop-down menu the registration and supplier name.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_vehicle.png"/> 
</div>


<h1><a name="r_vehicle">Retrieve Vehicle</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Reg No</p>
<p>-Make</p>
<p>-Model</p>
<p>-Supplier ID</p>
<div class=help_pic>
<img src="./include/images/help_page/r_vehicle.png"/> 
</div>


<h1><a name="u_vehicle">Update Vehicle</a></h1>
<p>Select the ID number of the vehicle from the table to update the vehicle with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_vehicle.png"/> 
</div>


<h1><a name="d_vehicle">Delete Vehicle (Not yet implemented)</a></h1>
<p>Enter the ID Number of the vehicle to be deleted. (Or select the ID number from the table like update vehicle and bring up a pop-up box asking whether the user is sure if they want to delete this vehicle or not.)</p>

<h1><a name="c_venue">Create Venue</a></h1>
<p>Stadium Name: Enter the name of the stadium.</p>
<p>Town: Enter the town where the stadium is.</p>
<p>Referred As: Enter a number to easily refer to this supplier elsewhere in the system.</p>
<div class=help_pic>
<img src="./include/images/help_page/c_vehicle.png"/> 
</div>


<h1><a name="r_venue">Retrieve Venue</a></h1>
<p> Enter one or more of the following fields with search criteria:</p>
<p>-ID</p>
<p>-Stadium Name</p>
<p>-Town</p>
<div class=help_pic>
<img src="./include/images/help_page/r_vehicle.png"/> 
</div>


<h1><a name="u_venue">Update Venue</a></h1>
<p>Select the ID number of the venue from the table to update the venue with the table on the right.</p>
<div class=help_pic>
<img src="./include/images/help_page/u_vehicle.png"/> 
</div>


<h1><a name="d_venue">Delete Venue (Not yet implemented)</a></h1>
<p>Enter the ID Number of the venue to be deleted.</p>


</div>







