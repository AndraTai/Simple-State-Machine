//
//  SimpleStateMachine.swift
//  SimpleStateMachine
//
//  Created by Andra on 2018/3/26.
//  Copyright © 2018年 asusdev. All rights reserved.
//

import Foundation

protocol State {
    var currentState: ConnectionState {get}
    func changeState(newState: ConnectionState) -> ConnectionState?
    func hadleEvent(event: ConnectionEvent, content: Any?, handler: (Bool) -> Void)
}

//Defining DEFAULT state rule here
class StateDefault: State {
    var currentState: ConnectionState = .DEFAULT
    func changeState(newState: ConnectionState) -> ConnectionState? {
        if currentState == newState {
            NSLog("Connection State is already in \(currentState), ingore this change")
            return nil
        } else {
            return newState
        }
    }
    
    //Deciding what event can be handled here
    func hadleEvent(event: ConnectionEvent, content: Any?, handler: (Bool) -> Void) {
        switch event {
        case .EVENT_1:
            handler(false)
        case .EVENT_2:
            handler(false)
        case .EVENT_3:
            handler(false)
        case .EVENT_4:
            handler(false)
        case .EVENT_5:
            handler(false)
        }
    }
}

//Defining STATE1 state rule here
class StateState1: State {
    var currentState: ConnectionState = .STATE1
    func changeState(newState: ConnectionState) -> ConnectionState? {
        if currentState == newState {
            NSLog("Connection State is already in \(currentState), ingore this change")
            return nil
        } else {
            return newState
        }
    }
    
    //Deciding what event can be handled in this state.
    func hadleEvent(event: ConnectionEvent, content: Any?, handler: (Bool) -> Void) {
        switch event {
        case .EVENT_1:
            handler(true)
        case .EVENT_2:
            handler(false)
        case .EVENT_3:
            handler(false)
        case .EVENT_4:
            handler(false)
        case .EVENT_5:
            handler(false)
        }
    }
}

//Defining STATE2 state rule here
class StateState2: State {
    var currentState: ConnectionState = .STATE2
    func changeState(newState: ConnectionState) -> ConnectionState? {
        if currentState == newState {
            NSLog("Connection State is already in \(currentState), ingore this change")
            return nil
        } else {
            return newState
        }
    }
    
    //Deciding what event can be handled in this state.
    func hadleEvent(event: ConnectionEvent, content: Any?, handler: (Bool) -> Void) {
        switch event {
        case .EVENT_1:
            handler(false)
        case .EVENT_2:
            handler(false)
        case .EVENT_3:
            handler(true)
        case .EVENT_4:
            handler(false)
        case .EVENT_5:
            handler(false)
        }
    }
}

//Defining STATE3 state rule
class StateState3: State {
    var currentState: ConnectionState = .STATE3
    func changeState(newState: ConnectionState) -> ConnectionState? {
        if currentState == newState {
            NSLog("Connection State is already in \(currentState), ingore this change")
            return nil
        } else {
            return newState
        }
    }
    
    //Deciding what event can be handled in this state.
    func hadleEvent(event: ConnectionEvent, content: Any?, handler: (Bool) -> Void) {
        switch event {
        case .EVENT_1:
            handler(false)
        case .EVENT_2:
            handler(false)
        case .EVENT_3:
            handler(false)
        case .EVENT_4:
            handler(true)
        case .EVENT_5:
            handler(false)
        }
    }
}

//Define state
enum ConnectionState: Int {
    case DEFAULT
    case STATE1
    case STATE2
    case STATE3
    
    func getInstance() -> State {
        switch self {
        case .DEFAULT:
            return StateDefault()
        case .STATE1:
            return StateState1()
        case .STATE2:
            return StateState2()
        case .STATE3:
            return StateState3()
        }
    }
}

//Define event
enum ConnectionEvent:Int {
    case EVENT_1
    case EVENT_2
    case EVENT_3
    case EVENT_4
    case EVENT_5
}

