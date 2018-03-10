//
//  File.swift
//  Jobs to GO!
//
//  Created by Ferdinand Lösch on 09.03.18.
//  Copyright © 2018 Ferdinand Lösch. All rights reserved.
// 

import Foundation
import FirebaseDatabase
import FirebaseStorage
import Firebase


class DBProvider {
    private static let _instance = DBProvider()

    static var Instance: DBProvider {
        return _instance
    }


    var dbRaf: DatabaseReference {
        return Database.database().reference()
    }

    var nameOfuser: DatabaseReference {
       return dbRaf.child(Constants.NAME)
    }

    var storageRef: StorageReference {
       return Storage.storage().reference()
   }
    
    
    
    func svaeUser(data: Array<String>) {
        
            self.nameOfuser.child(Constants.JOBE).setValue(data)
        
        
}
    
    func retrieveJob(callback: @escaping (_ arry: Array<String> )->Void){
        
                    nameOfuser.child(Constants.NAME).child(Constants.JOBE).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        if let value = snapshot.value as? Array<String> {
                            callback(value)
                        }
                        // ...
                    }) { (error) in
                        print(error.localizedDescription)
        
                    }
        
            }
    

    
    
   
//
//    let usersID = Auth.auth().currentUser?.uid
//
//    // requesteAccepted
//    func svaeUser(withID: String, email: String, password: String , name: String) {
//        let data: Dictionary<String, Any> = [Constants.EMAIL: email,Constants.PASSWORD: password, Constants.NAME: name ]
//        nameOfuser.child(withID).child(Constants.USER).setValue(data)
//        UserDefaults.standard.setValue(name, forKey: "user_name")
//        UserDefaults.standard.setValue(email, forKey: "user_email")
//
//    }
//    func svaeData(data: Dictionary<String, Any> ) {
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.DATA).setValue(data)
//        }
//    }
//
//    private func sessionN(sessionNumber: Int) {
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.SESSION).setValue(sessionNumber)
//        }
//    }
//
//
//
//
//    func uploadPhoto(image: UIImage ,callback: @escaping (_ error: String )->Void){
//        var data = NSData()
//        data = UIImageJPEGRepresentation(image, 0.8)! as NSData
//        if usersID != nil {
//            let filePath = "\(Auth.auth().currentUser!.uid)/\("userPhoto")"
//            let metaData = StorageMetadata()
//            metaData.contentType = "image/jpg"
//            self.storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                    callback("\(error.localizedDescription)")
//                    return
//                }else{
//                    //store downloadURL
//                    let downloadURL = metaData!.downloadURL()!.absoluteString
//                    //store downloadURL at database
//                    self.nameOfuser.child(self.usersID!).child(Constants.ImagePATH).updateChildValues([Constants.USERPHOTO: downloadURL])
//                    callback("non")
//                }
//
//            }
//        }
//    }
//
//
//
//
//
//    // retrieving user data from firebase
//    func retrieveUserValues(kay: String) -> String {
//        var string = ""
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.USER).observe(DataEventType.childChanged, with: { (snapshot) in
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//                string  = value?[kay] as? String ?? ""
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//
//            }
//        }
//        return string
//    }
//
//
//    func checkImage(callback: @escaping (_ image: UIImage)->Void) {
//
//        if usersID != nil {
//            nameOfuser.child(self.usersID!).child(Constants.ImagePATH).observe(DataEventType.childChanged, with: { (DataSnapshot) in
//
//            })
//
//
//
//
//        }
//    }
//
//
//
//    func retrieveImgae(callback: @escaping (_ image: UIImage)->Void) {
//        var image = UIImage()
//        if usersID != nil {
//            nameOfuser.child(self.usersID!).child(Constants.ImagePATH).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                print(snapshot.value as Any)
//                let value = snapshot.value as? NSDictionary
//                print("hi")
//                let URL  = value?[Constants.USERPHOTO] as? String ?? ""
//                if  (URL.range(of: "https://") != nil) {
//                    let imageURL = Storage.storage().reference(forURL: URL)
//                    imageURL.downloadURL(completion: { (url, error) in
//
//                        if error != nil {
//                            print(error?.localizedDescription as Any)
//                            return
//                        }
//
//                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//
//                            if error != nil {
//                                print(error!)
//                                return
//                            }
//
//                            guard let imageData = UIImage(data: data!) else { return }
//
//                            DispatchQueue.main.async {
//                                image = imageData
//                                callback(image)
//                                print("success")
//                            }
//
//                        }).resume()
//
//                    })
//                }
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//
//            }
//        }
//    }
//
//
//
//
//
//    func retrieveUserValues(key: String,callback: @escaping (_ name: String)->Void){
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.USER).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                if let value = snapshot.value as? NSDictionary {
//                    let  string  = value[key] as? String ?? ""
//                    callback(string)
//
//                }
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//
//            }
//        }
//    }
//
//    func retrieveUserStatistics(callback: @escaping (_ dictionary: NSDictionary )->Void){
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.DATA).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                if let value = snapshot.value as? NSDictionary {
//                    callback(value)
//                }
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//
//            }
//        }
//    }
//
//    func retrieveSession(callback: @escaping (_ number: Int )->Void){
//        if usersID != nil {
//            nameOfuser.child(usersID!).child(Constants.SESSION).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                if let value = snapshot.value as? Int {
//                    callback(value)
//                }
//            }) { (error) in
//                print(error.localizedDescription)
//
//            }
//        }
//    }
//
//
//
//
//    // updating and synchronising local database with firebase
//
//
//    // synchronises local database with firebase
//    func syncDatabases(callback: @escaping (_ completed: String)->Void){
//
//        retrieveUserValues(key: Constants.NAME, callback: {(name)-> Void in
//            print("got a name: \(name)")
//            UserDefaults.standard.setValue(name, forKey: Constants.NAME)
//
//        })
//
//        retrieveUserValues(key: Constants.EMAIL, callback: {(name)-> Void in
//            print("got a name: \(name)")
//            UserDefaults.standard.setValue(name, forKey: Constants.EMAIL)
//        })
//
//
//        retrieveSession(callback: {(number)-> Void in
//            print("got a nuber: \(number)")
//            UserDefaults.standard.setValue(number, forKey: Constants.SESSION)
//
//        })
//
//        retrieveUserStatistics(callback:  {(dictionary)-> Void in
//            print("got a name: \(dictionary)")
//            UserDefaults.standard.setValue((dictionary as Dictionary), forKey: Constants.DATA)
//
//        })
//
//
//        callback("finished")
//    }
//
//    func setToLogOut(){
//        UserDefaults.standard.setValue(0, forKey: Constants.SESSION)
//        UserDefaults.standard.setValue("Gut Grambow", forKey: Constants.NAME)
//        UserDefaults.standard.setValue("GutGramboe@gutgrambow.de", forKey: Constants.EMAIL)
//        UserDefaults.standard.setValue( ["ww": 0,"f1": 0,"f2":0,"f3":0,"f4":0,"f5":0], forKey: Constants.DATA)
//        UserDefaults.standard.setValue(nil, forKey: Constants.USERPHOTO)
//    }
//
//
//
//
//    func user_session() {
//        if let session = UserDefaults.standard.value(forKey: Constants.SESSION) as? Int {
//            UserDefaults.standard.setValue(session + 1, forKey: Constants.SESSION)
//            sessionN(sessionNumber: session + 1)
//        } else  {
//            UserDefaults.standard.setValue(1, forKey: Constants.SESSION)
//        }
//    }
//
//    func user_name() -> String {
//        if let session = UserDefaults.standard.value(forKey: Constants.NAME) as? String {
//            return session
//        } else  {
//            return "GutGramow"
//        }
//    }
//
//    func user_email() -> String {
//        if let session = UserDefaults.standard.value(forKey: Constants.EMAIL) as? String {
//            return session
//        } else  {
//            return "GutGramow@me.com"
//        }
//    }
//
//    func user_data() -> Dictionary<String, Int> {
//        if let session = UserDefaults.standard.value(forKey: Constants.DATA) as? Dictionary<String, Any> {
//            return session as! Dictionary<String, Int>
//        } else  {
//            return ["ww": 0,"f1": 0,"f2":0,"f3":0,"f4":0,"f5":0]
//        }
//    }
//
//
//    // synchronisers firebase with local database
//    func updateFBDatabase(){
//        if let sessiondata = UserDefaults.standard.value(forKey: Constants.DATA) as? Dictionary<String, Any> {
//            svaeData(data: sessiondata )
//        }
//    }
//
}
