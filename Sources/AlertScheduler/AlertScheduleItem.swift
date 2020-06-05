import Foundation

@objc public class AlertScheduleItem: NSObject {
    @objc public init(title: String?, message: String, buttonText: String) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        super.init()
    }
    @objc public let title: String?
    @objc public let message: String
    @objc public let buttonText: String
}

