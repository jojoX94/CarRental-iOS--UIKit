//
//  VC.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
