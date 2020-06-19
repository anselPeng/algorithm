//
//  ANFib.swift
//  ANAlgorithm
// 斐波拉契。n = n-1 + n-2
//  Created by VSPN.iMAC8 on 2020/6/5.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANMyclass {
    
}




class ANFib: NSObject {
    

    func fib(n:Int) -> Int {
        if n == 0 {
            return 0;
        }
        if n == 1 {
            return 1;
        }
        return fib(n: n-1) + fib(n: n-2);
    }
    
    func fib1(n:Int) -> Int {
        if n<2 {
            return n;
        }
        var first = 0;
        var second = 1;
        
        for _ in 0..<n-1 {
            let t = second
            second = first+second
            first = t
        }
        
        return second
       }
       
    
}
