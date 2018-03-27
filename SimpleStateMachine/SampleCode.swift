//
//  SampleCode.swift
//  SimpleStateMachine
//
//  Created by Andra on 2018/3/26.
//  Copyright © 2018年 asusdev. All rights reserved.
//

import Foundation

class SampleCode {
    
    private var state = ConnectionState.DEFAULT {
        didSet {
            NSLog("Enter State: \(state)")
            switch state {
            case .DEFAULT: break
            case .STATE1:
                NSLog("do somthing")
                break
            case .STATE2:
                NSLog("do somthing")
                break
            case .STATE3:
                NSLog("do somthing")
                break
            }
        }
    }
    
    private func eventHandler(event: ConnectionEvent, content: Any?) {
        NSLog("Handle event = \(event)")
        self.state.getInstance().hadleEvent(event: event, content: content, handler: { (allowProcess) -> Void in
            if allowProcess {
                switch event {
                case .EVENT_1:
                    NSLog("do somthing")
                    break
                case .EVENT_2:
                    NSLog("do somthing")
                    break
                case .EVENT_3:
                    NSLog("do somthing")
                    break
                case .EVENT_4:
                    NSLog("do somthing")
                    break
                case .EVENT_5:
                    NSLog("do somthing")
                    break
                }
            } else {
                NSLog("ingore \(event) in current state - \(self.state)")
            }
        })
    }
    
    private func changeState(newState: ConnectionState) {
        if let newState = state.getInstance().changeState(newState: newState) {
            state = newState
        }
    }
    
    public func test() {
        changeState(newState: .STATE1)
        eventHandler(event: .EVENT_1, content: nil)
    }
    
}
