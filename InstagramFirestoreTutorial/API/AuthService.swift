//
//  AuthService.swift
//  InstagramFirestoreTutorial
//
//  Created by LeeJaeHyeok on 2021/09/05.
//


import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(WithCredential credentials: AuthCredentials) {
        print("DEBUG: credentials are \(credentials)")
    }
}
