import Foundation

class LoginService: HTTPDynamicStubs {
    
    public func provideLoginSuccess() {
        setupStub(url: "/login", filename: "login.success", method: .POST)
    }
    
    public func provideLoginFail() {
        setupStub(url: "/login", filename: "login.success", method: .POST, response: 404)
    }
}
