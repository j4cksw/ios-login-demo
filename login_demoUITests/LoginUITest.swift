import XCTest

class LoginUITest: XCTestCase {
    
    var app: XCUIApplication?
    var serverStub: HTTPDynamicStubs?
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        serverStub = HTTPDynamicStubs()
        serverStub?.setUp()
        
        app = XCUIApplication()
        app?.launch()
    }
    
    override func tearDown() {
        serverStub?.tearDown()
        super.tearDown()
    }
    
    func testLoginSuccess() {
        //Stub login service to always pass
        
        //Perform login
        
        //Verify result
    }
    
}
