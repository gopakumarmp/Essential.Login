import UIKit

// API Module

class APIClient {
    func login(user: String, password: String, completion: (LoggedUser) -> Void) -> Void {
        // Simulation of an async URLRequest task
        print("Log in Completed by API Client")

        completion(LoggedUser(name: "Gopa",id:"1234"))
    }
}

// Login Module

typealias LoginLoader = (String, String, (LoggedInUser) -> Void) -> Void

struct LoggedInUser {
    var name: String
    var id:String
}

class LoginViewController {
    var loginLoader: LoginLoader?
    
    init(loginLoader: @escaping LoginLoader) {
        self.loginLoader = loginLoader
    }
    
    func onTapLogin() {
        loginLoader?("Gopa", "Password") {
            loggedUser in
            print("Log in Completed by Module")
        }
    }
}

// Main Module composition

var apiClient = APIClient()
var loginViewController = LoginViewController(loginLoader: apiClient.login)
loginViewController.onTapLogin()
