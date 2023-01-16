//
//  AppDelegate.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import UIKit
import CoreData
import GoogleSignIn
import KakaoSDKCommon
import KakaoSDKAuth
import AuthenticationServices
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        KakaoSDK.initSDK(appKey: "${NATIVE_APP_KEY}")
        //MARK: ForAppleLogin
        let appleIDProvider = ASAuthorizationAppleIDProvider()
                //forUserID = userIdentifier
                appleIDProvider.getCredentialState(forUserID: "001281.9301aaa1f617423c9c7a64b671b6eb84.0758") { (credentialState, error) in
                    switch credentialState {
                    case .authorized:
                        // The Apple ID credential is valid.
                        print("해당 ID는 연동되어있습니다.")
                    case .revoked:
                        // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                        print("해당 ID는 연동되어있지않습니다.")
                    case .notFound:
                        // The Apple ID credential is either was not found, so show the sign-in UI.
                        print("해당 ID를 찾을 수 없습니다.")
                    default:
                        break
                    }
                }
                //앱 실행 중 강제로 연결 취소 시
                NotificationCenter.default.addObserver(forName: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil, queue: nil) { (Notification) in
                    print("Revoked Notification")
                    // 로그인 페이지로 이동
                }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "haruSpeak_iOS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    //MARK: - forGoogleSocialLogin
        let signInConfig = GIDConfiguration.init(clientID: "795436124010-3dbce8b9tv7f6ev3j5a3rjdt8oibltt4.apps.googleusercontent.com")
        
        
        func application(
          _ app: UIApplication,
          open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
        ) -> Bool {
          var handled: Bool

          handled = GIDSignIn.sharedInstance.handle(url)
          if handled {
            return true
          }

          // Handle other custom URL types.

          // If not handled by this app, return false.
          return false
        }

}

