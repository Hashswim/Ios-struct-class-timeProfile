//
//  CalculateQueueClass.swift
//  TimeProfilingClassWithStruct
//

import Foundation

class CalculatorItemQueueClass {
    var enqueue: [CalculateItem]
    var dequeue: [CalculateItem] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [CalculateItem]) {
        enqueue = queue
    }
    
    func pushLast(_ n: CalculateItem) {
        enqueue.append(n)
    }
    
    func popFirst() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    func popLast() -> CalculateItem? {
        var returnValue: CalculateItem?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }

    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

