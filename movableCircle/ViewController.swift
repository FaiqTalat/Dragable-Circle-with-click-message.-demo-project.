//
//  ViewController.swift
//  movableCircle
//
//  Created by FaiQ TalaT on 07/01/2016.
//  Copyright (c) 2016 Faiq Talat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movableCircle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // for moving...
        let panGesture = UIPanGestureRecognizer(target: self, action: "touchMoved:")
        self.movableCircle.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapOnCircle")
        self.movableCircle.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(animated: Bool) {
    
        self.movableCircle.layer.cornerRadius = self.movableCircle.frame.width / 2
        
        self.movableCircle.translatesAutoresizingMaskIntoConstraints()
        
    }

    func touchMoved(sender: UIPanGestureRecognizer){
    let location = sender.locationInView(self.view)
        println("location: \(location), sender.state: \(sender.state.hashValue)")
        self.movableCircle.center = location
        
    }
    func tapOnCircle(){
        let alert = UIAlertController(title: "DemoTitle", message: "Demo Message", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "GotIt", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

