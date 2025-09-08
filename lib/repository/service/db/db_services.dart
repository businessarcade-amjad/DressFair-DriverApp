// dartimport 'dart:developer';
//
// import 'package:health_book/model/add_contacts/add_contacts.dart';
// import 'package:health_book/model/chat_history_model.dart';
// import 'package:health_book/model/reminder_feature_model/add_reminder_model.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper {
//   String contactTable = 'contact_table';
//   String colId = 'id';
//   String colContactName = 'name';
//   String colContactNumber = 'number';
//
//   /////   Reminder Table =============== /////
//
//   String reminderTable = 'reminder_table';
//   String reminderColId = 'id';
//   String reminderColTaskTitle = 'task_title';
//   String reminderColTaskDescription = 'task_description';
//   String reminderColTaskDate = 'task_date';
//   String reminderColIsCompleted = 'isCompleted';
//   String reminderColIsInToDo = 'isInToDo';
//
//   /////   History Table =============== /////
//
//   String historyTable = 'history_table';
//   String historyId = 'historyId';
//   String uniqueIdentity = 'uniqueIdentity';
//   String historyMsg = 'historyMsg';
//   String historyIconImage = 'historyIconImage';
//   String historyCurrentDate = 'historyCurrentDate';
//   String historyIndexFromChat = 'historyIndexFromChat';
//   String historyIsUser = 'historyIsUser';
//
//   //////   History Table  =========///////
//
//   // named private constructor..(used to create an instance of a singleton class)
//   // it will be used to create an instance of the DatabaseHelper class
//   DatabaseHelper._createInstance();
//
//   //Now lets create an instance of the database
//   static DatabaseHelper? _databaseHelper; // this _databaseHelper will
//   //be referenced using 'this' keyword. It helps to access getters and
//   //setters of the class. for example: _database getter is used when we
//   //want to initialize the db.
//   factory DatabaseHelper() {
//     //factory keyword allows the constructor to return some value
//     if (_databaseHelper == null) {
//       //create an instance of _DatabaseHelper iff there is no instance created before
//       _databaseHelper = DatabaseHelper._createInstance();
//       //because of that null check this line above runs once only
//     }
//     return _databaseHelper!;
//   }
//
//   // lets initialize the database
//   static Database? _database;
//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initializeDatabase();
//     }
//     return _database!;
//   }
//
//   Future<Database> initializeDatabase() async {
//     String directoryPath = await getDatabasesPath();
//     String dbLocation = directoryPath + 'contact.db';
//
//     var contactDatabase =
//         await openDatabase(dbLocation, version: 1, onCreate: _createDbTable);
//     return contactDatabase;
//   }
//
//   void _createDbTable(Database db, int newVersion) async {
//     await db.execute(
//         'CREATE TABLE $reminderTable($reminderColId INTEGER PRIMARY KEY AUTOINCREMENT,$reminderColTaskTitle TEXT,$reminderColTaskDescription TEXT,$reminderColTaskDate TEXT,$reminderColIsCompleted INTEGER,$reminderColIsInToDo INTEGER)');
//     await db.execute(
//         'CREATE TABLE $contactTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colContactName TEXT, $colContactNumber TEXT,avatar TEXT)');
//     await db.execute(
//         'CREATE TABLE $historyTable($historyId INTEGER PRIMARY KEY AUTOINCREMENT, $uniqueIdentity TEXT, $historyMsg TEXT, $historyIconImage TEXT,$historyCurrentDate TEXT,$historyIndexFromChat INTEGER,$historyIsUser INTEGER)');
//   }
//
//   // Fetch Operation: get contact object from db
//   Future<List<Map<String, dynamic>>> getContactMapList() async {
//     Database db = await this.database;
//     List<Map<String, dynamic>> result =
//         await db.rawQuery('SELECT * FROM $contactTable order by $colId ASC');
//
//     // or
//     // var result = await db.query(contactTable, orderBy: '$colId ASC');
//     return result;
//   }
//
//   //Insert a contact object
//   Future<int> insertContact(TContact contact) async {
//     Database db = await this.database;
//     var result = await db.insert(contactTable, contact.toMap());
//     // print(await db.query(contactTable));
//     return result;
//   }
//
//   // update a contact object
//   Future<int> updateContact(TContact contact) async {
//     Database db = await this.database;
//     var result = await db.update(contactTable, contact.toMap(),
//         where: '$colId = ?', whereArgs: [contact.id]);
//     return result;
//   }
//
//   //delete a contact object
//   Future<int> deleteContact(int id) async {
//     Database db = await this.database;
//     int result =
//         await db.rawDelete('DELETE FROM $contactTable WHERE $colId = $id');
//     // print(await db.query(contactTable));
//     return result;
//   }
//
//   //get number of contact objects
//   Future<int> getCount() async {
//     Database db = await this.database;
//     List<Map<String, dynamic>> x =
//         await db.rawQuery('SELECT COUNT (*) from $contactTable');
//     int result = Sqflite.firstIntValue(x)!;
//     return result;
//   }
//
//   // Get the 'Map List' [ List<Map> ] and convert it to 'Contact List' [ List<Contact> ]
//   Future<List<TContact>> getContactList() async {
//     var contactMapList = await getContactMapList(); // Get 'Map List' from database
//     int count =
//         contactMapList.length; // Count the number of map entries in db table
//
//     List<TContact> contactList = <TContact>[];
//     // For loop to create a 'Contact List' from a 'Map List'
//     for (int i = 0; i < count; i++) {
//       contactList.add(TContact.fromMapObject(contactMapList[i]));
//     }
//
//     return contactList;
//   }
//
//   //// =================== Reminder Methods Start  ==================  /////
//
//   Future<int> insertTask(AddTaskDBReminder addTaskDBReminder) async {
//     Database db = await this.database;
//     var id = await db.insert(reminderTable, addTaskDBReminder.toMap());
//     log("ID===$id");
//     return id;
//   }
//
//   Future<List<AddTaskDBReminder>> getTaskListWithTaskId() async {
//     Database db = await this.database;
//
//     final List<Map<String, Object?>> queryResult =
//         await db.query(reminderTable);
//     return queryResult.map((e) => AddTaskDBReminder.fromMapObject(e)).toList();
//   }
//
//   Future deleteTableContent() async {
//     Database db = await this.database;
//     return await db.delete(
//       reminderTable,
//     );
//   }
//
//   Future<int> updateTask(AddTaskDBReminder addTaskDBReminder) async {
//     Database db = await this.database;
//     return await db.update(
//       reminderTable,
//       addTaskDBReminder.toMap(),
//       where: 'id = ?',
//       whereArgs: [addTaskDBReminder.id],
//     );
//   }
//
//   Future<int> deleteTask(int taskId) async {
//     Database db = await this.database;
//     return await db.delete(
//       reminderTable,
//       where: 'id = ?',
//       whereArgs: [taskId],
//     );
//   }
//
//   Future close() async {
//     Database db = await this.database;
//     db.close();
//   }
//
//   /// ========= History Table Methods ============== ///////
//
//   Future<int> insertSingleHistory(ChatHistoryModel chatHistoryModel) async {
//     Database db = await this.database;
//     var id = await db.insert(historyTable, chatHistoryModel.toJson());
//     log("ID===$id");
//     return id;
//   }
//
//   Future<List<ChatHistoryModel>> getAiHistory() async {
//     Database db = await this.database;
//
//     final List<Map<String, Object?>> queryResult = await db.query(historyTable);
//     return queryResult.map((e) => ChatHistoryModel.fromJson(e)).toList();
//   }
//
//   Future<int> deleteSingleChat(int historyId) async {
//     Database db = await this.database;
//     return await db.delete(
//       reminderTable,
//       where: 'id = ?',
//       whereArgs: [historyId],
//     );
//   }
// }
