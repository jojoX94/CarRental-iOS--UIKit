//
//  VC.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit
import FirebaseAuth

class VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func pushToViewController<T: UIViewController>(withIdentifier identifier: String, andType type: T.Type, reuse: Bool = true) {
        var found = false
        var viewController : UIViewController? = nil
        if reuse {
            if let viewControllers = navigationController?.viewControllers {
                let idx = viewControllers.firstIndex(where: { vc in
                    vc.restorationIdentifier == identifier
                })
                
                if let idx = idx {
                    found = true
                    viewController = navigationController?.viewControllers[idx]
                    if viewController != self {
                        navigationController?.viewControllers.remove(at: idx)
                    }
                }
            }
        }
        if !found {
            viewController = storyboard?.instantiateViewController(withIdentifier: identifier)
        }
        if let viewController = viewController {
            if viewController != self {
                pushTransition(viewController)
            }
        }
    }
    
    func pushTransition<T: UIViewController>(_ vc: T) {
        navigationController?.pushViewController(vc, animated: false)
    }

    func dismissKeyboard() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(dismissKeyboardTouchOutside))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
        }
        
        @objc private func dismissKeyboardTouchOutside() {
           view.endEditing(true)
        }
    
    func changeRootVC(to: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: to)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc)
    }
    
    func alertUser(of errorCode: AuthErrorCode.Code) {
        
        switch errorCode {
            
        case .accountExistsWithDifferentCredential:
            print("0- Indicates account linking is required.")
        case .adminRestrictedOperation:
            print("1- Indicates that the operation is admin restricted.")
        case .appNotAuthorized:
            print("2- Indicates the App is not authorized to use Firebase Authentication with the provided API Key.")
        case .appNotVerified:
            print("3- Indicates that the app could not be verified by Firebase during phone number authentication.")
        case .appVerificationUserInteractionFailure:
            print("4- Indicates a general failure during the app verification flow.")
        case .captchaCheckFailed:
            print("5- Indicates that the reCAPTCHA token is not valid.")
        case .credentialAlreadyInUse:
            print("6- Indicates an attempt to link with a credential that has already been linked with a different Firebase account")
        case .customTokenMismatch:
            print("7- Indicates the service account and the API key belong to different projects.")
        case .dynamicLinkNotActivated:
            print("8- Indicates that a Firebase Dynamic Link is not activated.")
        case .emailAlreadyInUse:
            print("9- Indicates the email used to attempt a sign up is already in use.")
        case .emailChangeNeedsVerification:
            print("10- Indicates that the a verifed email is required to changed to.")
        case .expiredActionCode:
            print("11- Indicates the OOB code is expired.")
        case .gameKitNotLinked:
            print("12- Indicates that the GameKit framework is not linked prior to attempting Game Center signin.")
        case .internalError:
            print("13- Indicates an internal error occurred.")
        case .invalidActionCode:
            print("15- Indicates the OOB code is invalid.")
        case .invalidAPIKey:
            print("15- Indicates an invalid API key was supplied in the request.")
        case .invalidAppCredential:
            print("16- Indicates that an invalid APNS device token was used in the verifyClient request.")
        case .invalidClientID:
            print("17- Indicates that the clientID used to invoke a web flow is invalid.")
        case .invalidContinueURI:
            print("18- Indicates that the domain specified in the continue URI is not valid.")
        case .invalidCredential:
            print("19- Indicates the IDP token or requestUri is invalid.")
        case .invalidCustomToken:
            print("20- Indicates a validation error with the custom token.")
        case .invalidDynamicLinkDomain:
            print("21- Indicates that the Firebase Dynamic Link domain used is either not configured or is unauthorized for the current project.")
        case .invalidEmail:
            print("22- Indicates the email is invalid.")
        case .invalidMessagePayload:
            print("23- Indicates that there are invalid parameters in the payload during a 'send password reset email' attempt.")
        case .invalidMultiFactorSession:
            print("24- Indicates that the multi factor session is invalid.")
        case .invalidPhoneNumber:
            print("25- Indicates that an invalid phone number was provided in a call to verifyPhoneNumber:completion:.")
        case .invalidProviderID:
            print("26- Represents the error code for when the given provider id for a web operation is invalid.")
        case .invalidRecipientEmail:
            print("27- Indicates that the recipient email is invalid.")
        case .invalidSender:
            print("28- Indicates that the sender email is invalid during a “send password reset email” attempt.")
        case .invalidUserToken:
            print("29- Indicates user’s saved auth credential is invalid, the user needs to sign in again.")
        case .invalidVerificationCode:
            print("30- Indicates that an invalid verification code was used in the verifyPhoneNumber request.")
        case .invalidVerificationID:
            print("31- Indicates that an invalid verification ID was used in the verifyPhoneNumber request.")
        case .keychainError:
            print("32- Indicates an error occurred while attempting to access the keychain.")
        case .localPlayerNotAuthenticated:
            print("33- Indicates that the local player was not authenticated prior to attempting Game Center signin.")
        case .maximumSecondFactorCountExceeded:
            print("34- Indicates that the maximum second factor count is exceeded.")
        case .malformedJWT:
            print("35- Raised when a JWT fails to parse correctly. May be accompanied by an underlying error describing which step of the JWT parsing process failed.")
        case .missingAndroidPackageName:
            print("36- Indicates that the android package name is missing when the androidInstallApp flag is set to true.")
        case .missingAppCredential:
            print("37- Indicates that the APNS device token is missing in the verifyClient request.")
        case .missingAppToken:
            print("38- Indicates that the APNs device token could not be obtained. The app may not have set up remote notification correctly, or may fail to forward the APNs device token to FIRAuth if app delegate swizzling is disabled.")
        case .missingContinueURI:
            print("39- Indicates that a continue URI was not provided in a request to the backend which requires one.")
        case .missingClientIdentifier:
            print("40- Indicates an error for when the client identifier is missing.")
        case .missingEmail:
            print("41- Indicates that an email address was expected but one was not provided.")
        case .missingIosBundleID:
            print("42- Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided.")
        case .missingMultiFactorSession:
            print("43- Indicates that the multi factor session is missing.")
        case .missingOrInvalidNonce:
            print("44- Indicates that the nonce is missing or invalid.")
        case .missingPhoneNumber:
            print("45- Indicates that a phone number was not provided in a call to verifyPhoneNumber:completion.")
        case .missingVerificationCode:
            print("46- Indicates that the phone auth credential was created with an empty verification code.")
        case .missingVerificationID:
            print("47- Indicates that the phone auth credential was created with an empty verification ID.")
        case .missingMultiFactorInfo:
            print("48- Indicates that the multi factor info is missing.")
        case .multiFactorInfoNotFound:
            print("49- Indicates that the multi factor info is not found.")
        case .networkError:
            print("50- Indicates a network error occurred (such as a timeout, interrupted connection, or unreachable host). These types of errors are often recoverable with a retry. The NSUnderlyingError field in the NSError.userInfo dictionary will contain the error encountered.")
        case.noSuchProvider:
            print("51- Indicates an attempt to unlink a provider that is not linked.")
        case .notificationNotForwarded:
            print("52- Indicates that the app fails to forward remote notification to FIRAuth.")
        case .nullUser:
            print("53- Indicates that a non-null user was expected as an argmument to the operation but a null user was provided.")
        case .operationNotAllowed:
            print("54- Indicates the administrator disabled sign in with the specified identity provider.")
        case .providerAlreadyLinked:
            print("55- Indicates an attempt to link a provider to which the account is already linked.")
        case .quotaExceeded:
            print("56- Indicates that the quota of SMS messages for a given project has been exceeded.")
        case .rejectedCredential:
            print("57- Indicates that the credential is rejected because it’s misformed or mismatching.")
        case .requiresRecentLogin:
            print("58- Indicates the user has attemped to change email or password more than 5 minutes after signing in.")
        case .secondFactorAlreadyEnrolled:
            print("59- Indicates that the second factor is already enrolled.")
        case .secondFactorRequired:
            print("60- Indicates that the second factor is required for signin.")
        case .sessionExpired:
            print("61- Indicates that the SMS code has expired.")
        case .tooManyRequests:
            print("62- Indicates that too many requests were made to a server method.")
        case .unauthorizedDomain:
            print("63- Indicates that the domain specified in the continue URL is not whitelisted in the Firebase console.")
        case .unsupportedFirstFactor:
            print("64- Indicates that the first factor is not supported.")
        case .unverifiedEmail:
            print("65- Indicates that the email is required for verification.")
        case .userDisabled:
            print("66- Indicates the user’s account is disabled on the server.")
        case .userMismatch:
            print("67- Indicates that an attempt was made to reauthenticate with a user which is not the current user.")
        case .userNotFound:
            print("68- Indicates the user account was not found.")
        case .userTokenExpired:
            print("69- Indicates the saved token has expired, for example, the user may have changed account password on another device. The user needs to sign in again on the device that made this request.")
        case .weakPassword:
            print("70- Indicates an attempt to set a password that is considered too weak.")
        case .webContextAlreadyPresented:
            print("71- Indicates that an attempt was made to present a new web context while one was already being presented.")
        case .webContextCancelled:
            print("72- Indicates that the URL presentation was cancelled prematurely by the user.")
        case .webInternalError:
            print("73- Indicates that an internal error occurred within a SFSafariViewController or WKWebView.")
        case .webNetworkRequestFailed:
            print("74- Indicates that a network request within a SFSafariViewController or WKWebView failed.")
        case .wrongPassword:
            print("75- Indicates the user attempted sign in with a wrong password.")
        case .webSignInUserInteractionFailure:
            print("76- Indicates a general failure during a web sign-in flow.")
        default:
            print("77- Unknown error occurred")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
