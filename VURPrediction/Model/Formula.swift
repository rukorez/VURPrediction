//
//  Ащд.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 15.03.2022.
//

import Foundation

struct Formula {
    
    var parametr1: String?
    var parametr2: String?
    var parametr3: String?
    var parametr4: String?
    var parametr5: String?
    
    func first() -> String? {
        guard parametr1 != "" && parametr2 != "" && parametr3 != "" && parametr4 != "" && parametr5 != "" else { return nil }
        guard let p1 = parametr1 else { return nil }
        let par1 = NSString(string: p1).doubleValue
        guard let p2 = parametr2 else { return nil }
        let par2 = NSString(string: p2).doubleValue
        guard let p3 = parametr3 else { return nil }
        let par3 = NSString(string: p3).doubleValue
        guard let p4 = parametr4 else { return nil }
        let par4 = NSString(string: p4).doubleValue
        guard let p5 = parametr5 else { return nil }
        let par5 = NSString(string: p5).doubleValue
        let a = -4.955 + 0.129 * par1 + 3.458 * par2 + 1.145 * par3 + 0.009 * par4 - 0.037 * par5
        let b = 1 / (1 + pow(2.7182818284, a)) * 100
        return String(format: "%.2f", b) + "%"
    }
    
    func second() -> String? {
        guard parametr1 != "" && parametr2 != "" && parametr3 != "" && parametr4 != "" && parametr5 != "" else { return nil }
        guard let p1 = parametr1 else { return nil }
        let par1 = NSString(string: p1).doubleValue
        guard let p2 = parametr2 else { return nil }
        let par2 = NSString(string: p2).doubleValue
        guard let p3 = parametr3 else { return nil }
        let par3 = NSString(string: p3).doubleValue
        guard let p4 = parametr4 else { return nil }
        let par4 = NSString(string: p4).doubleValue
        guard let p5 = parametr5 else { return nil }
        let par5 = NSString(string: p5).doubleValue
        let a = 10.415 - 0.214 * par3 + 0.723 * par4 - 10.9 * par2 - 0.098 * par5 - 0.329 * par1
        let b = 1 / (1 + pow(2.7182818284, -a)) * 100
        return String(format: "%.2f", b) + "%"
    }
    
    func third() -> String? {
        guard parametr1 != "" && parametr2 != "" && parametr3 != "" && parametr4 != "" && parametr5 != "" else { return nil }
        guard let p1 = parametr1 else { return nil }
        let par1 = NSString(string: p1).doubleValue
        guard let p2 = parametr2 else { return nil }
        let par2 = NSString(string: p2).doubleValue
        guard let p3 = parametr3 else { return nil }
        let par3 = NSString(string: p3).doubleValue
        guard let p4 = parametr4 else { return nil }
        let par4 = NSString(string: p4).doubleValue
        guard let p5 = parametr5 else { return nil }
        let par5 = NSString(string: p5).doubleValue
        let a = 16.705 - 12.175 * par3 + 43.498 * par4 - 183.385 * par2 - 1.079 * par5 + 4.44 * par1
        let b = 1 / (1 + pow(2.7182818284, -a)) * 100
        return String(format: "%.2f", b) + "%"
    }
    
}
