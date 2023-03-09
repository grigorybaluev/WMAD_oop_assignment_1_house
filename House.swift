//
//  House.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

class House {
    let maxSize: Int = 37
    let minSize: Int = 3
    var size: Int
    var border: Character?
    var fill: Character?
    
    var perimeter: Int {
        return size * 2 + (size + 2) * 3
    }
    
    var area: Double {
        let squareArea = pow(Double(size+1), 2)
        let triangleArea = sqrt(3.0)/4.0 * pow(Double(size), 2)
        return round(Double(squareArea + triangleArea)*100) / 100.0
    }
    
    init(size: Int, border: Character? = "X", fill: Character? = "*") {
        self.size = min(max(size, minSize), maxSize)
        self.border = border
        self.fill = fill
    }
    
    func grow() {
        if self.size < maxSize {
            self.size += 1
        }
    }
    
    func shrink() {
        if self.size > minSize {
            self.size -= 1
        }
    }
    
    func draw() {
        for row in 1...(size+2) {
            for _ in 0..<((size+2)-row) {
                print(" ", terminator: "")
            }
            if row == 1 {
                if let b = border {
                    print("\(b)")
                }
                continue
            }
            if row == 2 {
                if let b = border {
                    print("\(b) \(b)")
                }
                continue
            }
            if row > 2 {
                if let b = border {
                    print("\(b) ", terminator: "")
                }
                for _ in 0..<row-2 {
                    if let f = fill {
                        print(String(f), terminator: "")
                        print(" ", terminator: "")
                    }
                }
                if let b = border {
                    print("\(b)")
                }
            }
        }
        for _ in 0..<size-2 {
            if let b = border {
                print("  \(b) ", terminator: "")
            }
            for _ in 0..<size-2 {
                if let f = fill {
                    print(String(f), terminator: "")
                    print(" ", terminator: "")
                }
            }
            if let b = border {
                print("\(b)")
            }
        }
        print("  ", terminator: "")
        for _ in 0..<size {
            if let b = border {
                print("\(b) ", terminator: "")
            }
        }
        print()
    }
    
}
