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
        
        //Perform login
        app?.textFields["usernameInput"].tap()
        app?.textFields["usernameInput"].typeText("jack")
        
        app?.textFields["passwordInput"].tap()
        app?.textFields["passwordInput"].typeText("swallow")
        
        app?.buttons["Login"].tap()
        
        //Verify success result
        XCTAssertTrue((app?.staticTexts["Welcome!"].exists)!)
    }
    
    func testLoginFail() {
        //Stub login service to always pass
        stubbedLoginService?.provideLoginFail()
        
        //Perform login
        app?.textFields["usernameInput"].tap()
        app?.textFields["usernameInput"].typeText("jack")
        
        app?.textFields["passwordInput"].tap()
        app?.textFields["passwordInput"].typeText("")
        
        app?.buttons["Login"].tap()
        
        //Verify fail result
        XCTAssertTrue((app?.alerts["Login fail"].exists)!)
    }
    
}
