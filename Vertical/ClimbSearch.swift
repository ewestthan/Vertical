//
//  ClimbSearch.swift
//  Vertical
//
//  Created by user227432 on 11/10/22.
//

import Firebase
import FirebaseStorage

class SearchService: ObservableObject {
    let firestore = Firestore.firestore()
    let storage = Storage.storage()
    @Published var climbs: [ClimbProfileModel] = []
    @Published var users: [UserInfo] = []
    @Published var climbImages: [String: URL?] = [:]
    @Published var userImages: [String: URL?] = [:]
    let climbPath = "ClimbProfile"
    let userPath = "User"
    
    init() {
        // Something
    }
    
    func userSearch(userName: String) {
        self.users = []
        firestore.collection(self.userPath).whereField("username", isEqualTo: userName).getDocuments() {
            (querySnapshot, error) in
            if let error = error {
                print(error)
            } else {
                for document in querySnapshot!.documents {
                    do {
                        try self.users.append(document.data(as: UserInfo.self))
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    func climbSearch(climbName: String) {
        self.climbs = []
        firestore.collection(self.climbPath).whereField("Name", isEqualTo: climbName).getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            let climb = try document.data(as: ClimbProfileModel.self)
                            self.climbs.append(climb)
                            self.getClimbURL(path: climb.Picture_URL)
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    }
    
    func getClimbURL(path: String) {
            storage.reference(forURL: path).downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    print(error)
                    return
                }
                if self.climbImages[path] == nil {
                    self.climbImages[path] = url
                }
            })
        }
    
    func getUserURL(path: String) {
            storage.reference().child(path).downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                if self.userImages[path] == nil {
                    self.userImages[path] = url
                }
            })
        }
    
    func clearClimbCache() {
        climbs = []
        climbImages = [:]
    }
    
    func clearUserCache() {
        users = []
        userImages = [:]
    }
}
