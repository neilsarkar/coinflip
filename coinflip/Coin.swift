//
//  Coin.swift
//  coinflip
//
//  Created by Neil Sarkar on 5/15/16.
//  Copyright © 2016 Neil Sarkar. All rights reserved.
//

import Foundation


class Coin {
    static let DEFAULT_FLIP_LIMIT = 12;
    static let INTERVAL = 0.03;

    var currentValue = true;
    var flipCount = 0;
    var finalValue:Bool?;
    var timer:NSTimer?;
    var flipLimit = Coin.DEFAULT_FLIP_LIMIT;

    func flip() {
        if( flipCount > 0 ) { return; }
        let result = Int(arc4random_uniform(2)) == 1
        if( finalValue != nil && finalValue! == result ) {
            flipLimit = Coin.DEFAULT_FLIP_LIMIT + 1
        } else {
            flipLimit = Coin.DEFAULT_FLIP_LIMIT
        }
        finalValue = result;
        rotate()
    }
    
    func showResult(isHeads:Bool?) {
        NSNotificationCenter.defaultCenter().postNotificationName("Coin Updated", object: isHeads)
    }
    
    @objc private func rotate() {
        flipCount = flipCount + 1;
        if( flipCount > flipLimit && currentValue != finalValue ) {
            timer = NSTimer.scheduledTimerWithTimeInterval(Coin.INTERVAL * Double(flipCount), target: self, selector: #selector(finish), userInfo: nil, repeats: false)
            return
        }
        currentValue = !currentValue;
        showResult(currentValue);
        timer = NSTimer.scheduledTimerWithTimeInterval(Coin.INTERVAL * Double(flipCount), target: self, selector: #selector(rotate), userInfo: nil, repeats: false)
    }
    
    @objc private func finish() {
        flipCount = 0;
        timer?.invalidate()
        showResult(finalValue)
    }
}