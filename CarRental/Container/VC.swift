//
//  VC.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

class VC: UIViewController, NVActivityIndicatorViewable {
    
    // TODO: OLD LOADING VIEW
//    var loadingView: LoadingView? = nil
    
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                // TODO: Remove for right code
                self.startAnimating(nil, message: nil, messageFont: nil, type: .ballPulseSync, color: .white, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25), textColor: nil, fadeInAnimation: nil)
                // TODO: OLD LOADING VIEW
//                loadingView = LoadingView(frame: view.frame)
//                view.addSubview(loadingView!)
            } else {
                self.stopAnimating()
                // TODO: OLD LOADING VIEW
//                loadingView?.removeFromSuperview()
            }
        }
    }

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
        var messageCode: String? = nil
        switch errorCode {
            
        case .accountExistsWithDifferentCredential:
             messageCode = "0- Indicates account linking is required."
        case .adminRestrictedOperation:
             messageCode = "1- Indicates that the operation is admin restricted."
        case .appNotAuthorized:
             messageCode = "2- Indicates the App is not authorized to use Firebase Authentication with the provided API Key."
        case .appNotVerified:
             messageCode = "3- Indicates that the app could not be verified by Firebase during phone number authentication."
        case .appVerificationUserInteractionFailure:
             messageCode = "4- Indicates a general failure during the app verification flow."
        case .captchaCheckFailed:
             messageCode = "5- Indicates that the reCAPTCHA token is not valid."
        case .credentialAlreadyInUse:
             messageCode = "6- Indicates an attempt to link with a credential that has already been linked with a different Firebase account"
        case .customTokenMismatch:
             messageCode = "7- Indicates the service account and the API key belong to different projects."
        case .dynamicLinkNotActivated:
             messageCode = "8- Indicates that a Firebase Dynamic Link is not activated."
        case .emailAlreadyInUse:
             messageCode = "9- Indicates the email used to attempt a sign up is already in use."
        case .emailChangeNeedsVerification:
             messageCode = "10- Indicates that the a verifed email is required to changed to."
        case .expiredActionCode:
             messageCode = "11- Indicates the OOB code is expired."
        case .gameKitNotLinked:
             messageCode = "12- Indicates that the GameKit framework is not linked prior to attempting Game Center signin."
        case .internalError:
             messageCode = "13- Indicates an internal error occurred."
        case .invalidActionCode:
             messageCode = "15- Indicates the OOB code is invalid."
        case .invalidAPIKey:
             messageCode = "15- Indicates an invalid API key was supplied in the request."
        case .invalidAppCredential:
             messageCode = "16- Indicates that an invalid APNS device token was used in the verifyClient request."
        case .invalidClientID:
             messageCode = "17- Indicates that the clientID used to invoke a web flow is invalid."
        case .invalidContinueURI:
             messageCode = "18- Indicates that the domain specified in the continue URI is not valid."
        case .invalidCredential:
             messageCode = "19- Indicates the IDP token or requestUri is invalid."
        case .invalidCustomToken:
             messageCode = "20- Indicates a validation error with the custom token."
        case .invalidDynamicLinkDomain:
             messageCode = "21- Indicates that the Firebase Dynamic Link domain used is either not configured or is unauthorized for the current project."
        case .invalidEmail:
             messageCode = "22- Indicates the email is invalid."
        case .invalidMessagePayload:
             messageCode = "23- Indicates that there are invalid parameters in the payload during a 'send password reset email' attempt."
        case .invalidMultiFactorSession:
             messageCode = "24- Indicates that the multi factor session is invalid."
        case .invalidPhoneNumber:
             messageCode = "25- Indicates that an invalid phone number was provided in a call to verifyPhoneNumber:completion:."
        case .invalidProviderID:
             messageCode = "26- Represents the error code for when the given provider id for a web operation is invalid."
        case .invalidRecipientEmail:
             messageCode = "27- Indicates that the recipient email is invalid."
        case .invalidSender:
             messageCode = "28- Indicates that the sender email is invalid during a “send password reset email” attempt."
        case .invalidUserToken:
             messageCode = "29- Indicates user’s saved auth credential is invalid, the user needs to sign in again."
        case .invalidVerificationCode:
             messageCode = "30- Indicates that an invalid verification code was used in the verifyPhoneNumber request."
        case .invalidVerificationID:
             messageCode = "31- Indicates that an invalid verification ID was used in the verifyPhoneNumber request."
        case .keychainError:
             messageCode = "32- Indicates an error occurred while attempting to access the keychain."
        case .localPlayerNotAuthenticated:
             messageCode = "33- Indicates that the local player was not authenticated prior to attempting Game Center signin."
        case .maximumSecondFactorCountExceeded:
             messageCode = "34- Indicates that the maximum second factor count is exceeded."
        case .malformedJWT:
             messageCode = "35- Raised when a JWT fails to parse correctly. May be accompanied by an underlying error describing which step of the JWT parsing process failed."
        case .missingAndroidPackageName:
             messageCode = "36- Indicates that the android package name is missing when the androidInstallApp flag is set to true."
        case .missingAppCredential:
             messageCode = "37- Indicates that the APNS device token is missing in the verifyClient request."
        case .missingAppToken:
             messageCode = "38- Indicates that the APNs device token could not be obtained. The app may not have set up remote notification correctly, or may fail to forward the APNs device token to FIRAuth if app delegate swizzling is disabled."
        case .missingContinueURI:
             messageCode = "39- Indicates that a continue URI was not provided in a request to the backend which requires one."
        case .missingClientIdentifier:
             messageCode = "40- Indicates an error for when the client identifier is missing."
        case .missingEmail:
             messageCode = "41- Indicates that an email address was expected but one was not provided."
        case .missingIosBundleID:
             messageCode = "42- Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided."
        case .missingMultiFactorSession:
             messageCode = "43- Indicates that the multi factor session is missing."
        case .missingOrInvalidNonce:
             messageCode = "44- Indicates that the nonce is missing or invalid."
        case .missingPhoneNumber:
             messageCode = "45- Indicates that a phone number was not provided in a call to verifyPhoneNumber:completion."
        case .missingVerificationCode:
             messageCode = "46- Indicates that the phone auth credential was created with an empty verification code."
        case .missingVerificationID:
             messageCode = "47- Indicates that the phone auth credential was created with an empty verification ID."
        case .missingMultiFactorInfo:
             messageCode = "48- Indicates that the multi factor info is missing."
        case .multiFactorInfoNotFound:
             messageCode = "49- Indicates that the multi factor info is not found."
        case .networkError:
             messageCode = "50- Indicates a network error occurred (such as a timeout, interrupted connection, or unreachable host). These types of errors are often recoverable with a retry. The NSUnderlyingError field in the NSError.userInfo dictionary will contain the error encountered."
        case.noSuchProvider:
             messageCode = "51- Indicates an attempt to unlink a provider that is not linked."
        case .notificationNotForwarded:
             messageCode = "52- Indicates that the app fails to forward remote notification to FIRAuth."
        case .nullUser:
             messageCode = "53- Indicates that a non-null user was expected as an argmument to the operation but a null user was provided."
        case .operationNotAllowed:
             messageCode = "54- Indicates the administrator disabled sign in with the specified identity provider."
        case .providerAlreadyLinked:
             messageCode = "55- Indicates an attempt to link a provider to which the account is already linked."
        case .quotaExceeded:
             messageCode = "56- Indicates that the quota of SMS messages for a given project has been exceeded."
        case .rejectedCredential:
             messageCode = "57- Indicates that the credential is rejected because it’s misformed or mismatching."
        case .requiresRecentLogin:
             messageCode = "58- Indicates the user has attemped to change email or password more than 5 minutes after signing in."
        case .secondFactorAlreadyEnrolled:
             messageCode = "59- Indicates that the second factor is already enrolled."
        case .secondFactorRequired:
             messageCode = "60- Indicates that the second factor is required for signin."
        case .sessionExpired:
             messageCode = "61- Indicates that the SMS code has expired."
        case .tooManyRequests:
             messageCode = "62- Indicates that too many requests were made to a server method."
        case .unauthorizedDomain:
             messageCode = "63- Indicates that the domain specified in the continue URL is not whitelisted in the Firebase console."
        case .unsupportedFirstFactor:
             messageCode = "64- Indicates that the first factor is not supported."
        case .unverifiedEmail:
             messageCode = "65- Indicates that the email is required for verification."
        case .userDisabled:
             messageCode = "66- Indicates the user’s account is disabled on the server."
        case .userMismatch:
             messageCode = "67- Indicates that an attempt was made to reauthenticate with a user which is not the current user."
        case .userNotFound:
             messageCode = "68- Indicates the user account was not found."
        case .userTokenExpired:
             messageCode = "69- Indicates the saved token has expired, for example, the user may have changed account password on another device. The user needs to sign in again on the device that made this request."
        case .weakPassword:
             messageCode = "70- Indicates an attempt to set a password that is considered too weak."
        case .webContextAlreadyPresented:
             messageCode = "71- Indicates that an attempt was made to present a new web context while one was already being presented."
        case .webContextCancelled:
             messageCode = "72- Indicates that the URL presentation was cancelled prematurely by the user."
        case .webInternalError:
             messageCode = "73- Indicates that an internal error occurred within a SFSafariViewController or WKWebView."
        case .webNetworkRequestFailed:
             messageCode = "74- Indicates that a network request within a SFSafariViewController or WKWebView failed."
        case .wrongPassword:
             messageCode = "75- Indicates the user attempted sign in with a wrong password."
        case .webSignInUserInteractionFailure:
             messageCode = "76- Indicates a general failure during a web sign-in flow."
        default:
             messageCode = "77- Unknown error occurred"
        }
        
        if let messageCode = messageCode {
            AppSnackBar.display(type: .error, contextView: self.view, message: messageCode, duration: .infinite)
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
