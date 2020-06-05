import UIKit

@objc public class AlertScheduler: NSObject {
    @objc func append(item: AlertScheduleItem) {
        dispatchQueue.async {
            self.semaphore.wait()
            DispatchQueue.main.async {
                if let topViewController = self.topMostViewController {
                    if topViewController is UIAlertController {
                        topViewController.dismiss(animated: true, completion: nil)
                        if let presentingViewController = topViewController.presentingViewController {
                            self.showAlert(item: item, on: presentingViewController)
                        } else {
                            self.semaphore.signal()
                        }
                    } else {
                        self.showAlert(item: item, on: topViewController)
                    }
                } else {
                    self.semaphore.signal()
                }
            }
        }
    }
    
    private func showAlert(item: AlertScheduleItem, on viewController: UIViewController) {
        let alertController = UIAlertController(title: item.title, message: item.message, preferredStyle: .alert)
        let action = UIAlertAction(title: item.buttonText, style: .default) { (action) in
            self.semaphore.signal()
        }
        
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    private var topMostViewController: UIViewController? {
        var currentViewController = UIApplication.shared.keyWindow?.rootViewController
        var presentedViewController = currentViewController?.presentedViewController
        
        while presentedViewController != nil {
            currentViewController = presentedViewController
            if let navigationViewController = presentedViewController as? UINavigationController {
                presentedViewController = navigationViewController.visibleViewController?.presentedViewController
            } else if let tabBarController = presentedViewController as? UITabBarController {
                if let selectedViewController = tabBarController.selectedViewController {
                    presentedViewController = selectedViewController.presentedViewController
                } else {
                    presentedViewController = tabBarController.presentedViewController
                }
            } else {
                presentedViewController = presentedViewController?.presentedViewController
            }
        }
        
        return currentViewController
    }
    
    private let dispatchQueue = DispatchQueue(label: "AlertScheduler.dispatchQueue")
    private let semaphore = DispatchSemaphore(value: 1)
    
    @objc static let shared = AlertScheduler()
}
