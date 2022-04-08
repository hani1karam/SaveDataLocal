# Save Data Local
Five Type To Save Data Local 
- UserDefault
- KeyChain
- CoreData
- SQLite
- Realm
# 1-UserDefault
why ?
to store app settings or user preferences. UserDefaults lets you store key-value pairs, where a key is always a String and value can be one of the following data types: Data, String, Number, Date, Array or Dictionary.
how ?
to set data :
UserDefaults.standard.setValue(textField.text, forKey: "email")
to get data:
UserDefaults.standard.value(forKey: "email")

# 2-keychain
* why?
 The keychain is a secure and encrypted storage place for sensitive data
 * how? 
to set:
        keychain.set(textField.text ?? "", forKey: "email")
to get:
        keychain.get("email")


# 3-coreData
* why?
to save your application's permanent data for offline use, to cache temporary data, and to add undo functionality to your app on a single device
* how?
to add data :
        dataManager?.addFavoritesItem(item: RecipeItemModel(id: "1",name: "Hany"))
to get data :
      dataManager?.fetchFavoritesListList()[0].name 
      
# 4-SQLITE
SQLite is a library that implements a lightweight database engine that is incredibly performant and, therefore, a great fit for embedded systems, such as mobile devices. Even though SQLite is advertised as a relational database, it is important to realize that the developer is in charge of maintaining the relationships between records stored in the database.


# 5- Realm
Realm’s local database persists data on-disk, so apps work as well offline as they do online..
