import Foundation
import XCTest

class LoginScreen {
    
    var app: XCUIApplication?
    
    public init(app: XCUIApplication) {
        self.app = app
    }
    
    func inputUsername(username: String) {
        app?.textFields["usernameInput"].tap()
        app?.textFields["usernameInput"].typeText(username)
    }
    
    func inputPassword(password: String) {
        app?.textFields["passwordInput"].tap()
        app?.textFields["passwordInput"].typeText(password)
    }
    
    func tapLoginButton() {
        app?.buttons["Login"].tap()
    }
    
    func welcomeMessageShouldExist() {
        XCTAssertTrue((app?.staticTexts["Welcome!"].exists)!)
    }
    
    func errorMessageShouldExist() {
        XCTAssertTrue((app?.alerts["Login fail"].exists)!)
    }
}
