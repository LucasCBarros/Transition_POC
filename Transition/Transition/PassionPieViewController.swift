//
//  PassionPieViewController.swift
//  Transition
//
//  Created by Lucas Barros on 11/08/17.
//  Copyright © 2017 Lucas Barros. All rights reserved.
//

import UIKit

class PassionPieViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var hungerButton: UIButton!
    @IBOutlet weak var almostButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hungerButton.layer.cornerRadius = hungerButton.frame.size.width / 2
        almostButton.layer.cornerRadius = almostButton.frame.size.width / 2
        noButton.layer.cornerRadius = noButton.frame.size.width / 2
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = hungerButton.center
        transition.circleColor = hungerButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = hungerButton.center
        transition.circleColor = hungerButton.backgroundColor!
        
        return transition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.transitioningDelegate = self
        destination.modalPresentationStyle = .custom
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
