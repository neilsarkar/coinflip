//
//  ViewController.swift
//  coinflip
//
//  Created by Neil Sarkar on 5/15/16.
//  Copyright © 2016 Neil Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func buttonPressed(sender: AnyObject) {
        let result = self.calculateResult();
        self.showResult(result);
    }
 
    func calculateResult() -> Bool {
        let flip = Int(arc4random_uniform(2))
        return flip == 1;
    }
    
    func showResult(result: Bool) {
        if( result ) {
            resultLabel.text = "Heads"
        } else {
            resultLabel.text = "Tails"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

