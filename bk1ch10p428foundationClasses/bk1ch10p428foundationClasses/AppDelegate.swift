

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var progress : Double = 0.0 {
        didSet {
            print("progress set to \(progress)")
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]? = [:]) -> Bool {
        // Override point for customization after application launch.
        let prog = "prog" as Notification.Name
        NotificationCenter.default().addObserver(self, selector: #selector(doProg), name: prog, object: self)
        NotificationCenter.default().post(name: prog, object: self, userInfo: ["progress":4.2])
        return true
    }
    
    func doProg(_ n:Notification) {
        if let prog = n.userInfo?["progress"] as? Double {
            self.progress = prog
        }
    }



}

