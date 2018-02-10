import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    @IBAction func onLoginButtonClicked(_ sender: UIButton) {
        Alamofire.request("http://localhost:8882/login", method: .post, parameters: [:],encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseData {
            response in
            
            switch response.result {
                
            case .success:
                self.openWelcomeScreen()
                
                break
            case .failure:
                
                self.showAlert()
            }
        }
    }
    
    private func openWelcomeScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Login fail", message:
            "An error occurs please try again later.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

