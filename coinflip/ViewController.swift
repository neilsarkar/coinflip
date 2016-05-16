//
//  ViewController.swift
//  coinflip
//
//  Created by Neil Sarkar on 5/15/16.
//  Copyright © 2016 Neil Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var coin = Coin()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        coin.flip()
    }
    
    func handleCoinUpdate(notification:NSNotification?) {
        let isHeads = notification!.object as! Bool
        if( isHeads ) {
            resultLabel.text = "Heads"
        } else {
            resultLabel.text = "Tails"
        }
    }

    func listen() {
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self,
                       selector: #selector(ViewController.handleCoinUpdate),
                       name: "Coin Updated",
                       object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listen()
        resultLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

