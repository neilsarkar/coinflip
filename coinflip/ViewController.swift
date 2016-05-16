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
        playGame()
    }

    
    var coin = Coin()
    var isHeads:Bool?
    var coinState = true;
    var timer:NSTimer?
    var flipCount = 0;
    var flipLimit = 10;
    let DefaultFlipLimit = 10;
    
    func playGame() {
        coin.cool()
        if( flipCount > 0 ) { return; }
        let result = Int(arc4random_uniform(2)) == 1
        if( isHeads != nil && isHeads! == result ) {
            flipLimit = DefaultFlipLimit + 1
        } else {
            flipLimit = DefaultFlipLimit
        }
        isHeads = result;
        flip()
    }

    func flip() {
        flipCount = flipCount + 1;
        if( flipCount > flipLimit ) {
            flipCount = 0;
            timer!.invalidate()
            return showResult(isHeads)
        }
        coinState = !coinState;
        showResult(coinState);
        timer = NSTimer.scheduledTimerWithTimeInterval(0.03 * Double(flipCount), target: self, selector: #selector(ViewController.flip), userInfo: nil, repeats: false)
    }
    
    func showResult(isHeads:Bool?) {
        if( isHeads! ) {
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

