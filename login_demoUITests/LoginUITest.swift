import XCTest

class LoginUITest: XCTestCase {
    
    var app: XCUIApplication?
    var stubbedLoginService: LoginService?
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        stubbedLoginService = LoginService()
        stubbedLoginService?.setUp()
        
        app = XCUIApplication()
        app?.launchArguments.append("UITEST")
        app?.launch()
    }
    
    override func tearDown() {
        stubbedLoginService?.tearDown()
        super.tearDown()
    }
    
    func testLoginSuccess() {
        //Stub login service to always pass
        stubbedLoginService?.provideLoginSuccess()
        
        app?.textFields["usernameInput"].tap()
        app?.textFields["usernameInput"].typeText(username)
        app?.textFields["passwordInput"].tap()
        app?.textFields["passwordInput"].typeText(password)
        app?.buttons["Login"].tap()
        
        //Perform login
        let loginScreen = LoginScreen(app: app!)
        loginScreen.inputUsername(username: "jack")
        loginScreen.inputPassword(password: "swallow")

        loginScreen.tapLoginButton()
        
        //Verify success result
        loginScreen.welcomeMessageShouldExist()
    }
    
    func testLoginFail() {
        //Stub login service to always pass
        stubbedLoginService?.provideLoginFail()
        
        //Perform login
        let loginScreen = LoginScreen(app: app!)
        loginScreen.inputUsername(username: "")
        loginScreen.inputPassword(password: "")
        
        loginScreen.tapLoginButton()
        
        //Verify fail result
        loginScreen.errorMessageShouldExist()
    }
    
}
