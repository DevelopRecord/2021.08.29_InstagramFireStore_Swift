//
//  AuthentificationViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by LeeJaeHyeok on 2021/09/04.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthentificationViewModel {
    var formValid: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthentificationViewModel {
    var email: String?
    var password: String?
    
    var formValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

struct RegistrationViewModel: AuthentificationViewModel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false &&
               fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
