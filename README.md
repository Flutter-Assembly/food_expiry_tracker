<h1 align="center">Food expiry tracker : PantryRack</h1>

<div align="center">
  <strong>An Offline Food Expiry Date Reminder</strong>
</div>

<div align="center">
  Built with Flutter, Provider, and Firebases
</div>

# Screenshots
<pre>

</pre>


## Key Features
* __Homepage food list grouped by spaces__ 
  * Homepage containing all the registered food items
  * Total food items added per space
  * Total food about to expire per space
  * Restock alert when food quantity getting low
* __Shared preference data storage__ 
  * Storing user objects in shared preference
  * Authenticated user and preference settings retrieval upon application launch
  * JSON encoding and decoding
* __Adding new Food Item, details include:__ 
  * Food name
  * Food description in milligrams
  * Food image (Optional)
  * Food category
  * Food storage type e.g Fridge, Freezer, Store, Pantry etc.
  * Purchased date using Time Picker
  * Expired date using Time Picker
  * Reminder interval selection  
* __Notification reminding__
  * Usage of Local Notifications to display Food expiry and stock level alert
  * Randomly-generated IDs for each notification
  * Daily reminders with set intervals, based on user preference
* __Registeration error checking__ 
  * Name duplication check
  * Empty/not specified fields check 
* __Individual food detail page__ 
  * In-depth details about each Food item upon tapping
* __Delete a Food item:__ 
  * Erase the specified food object from sqlite
  * Erase corresponding scheduled notifications 
