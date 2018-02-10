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
        
        //Verify success result
    }
    
    func testLoginFail() {
        //Stub login service to always pass
        stubbedLoginService?.provideLoginFail()
        
        //Perform login
        
        //Verify fail result
    }
    
}
