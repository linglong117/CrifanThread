//
//  CrifanThread.swift
//  CrifanLibSwift
//
//  Created by licrifan on 16/7/2.
//  Copyright © 2016年 licrifan. All rights reserved.
//

import UIKit

let MainThread:dispatch_queue_t = dispatch_get_main_queue()

let UserInteractiveThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
let UserInitiatedThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
let DefaultThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
let UtilityThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
let BackgroundThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
let UnspecifiedThread:dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_UNSPECIFIED, 0)


/***************************************************************************
 * GCD/Queue/Thread functions
 ***************************************************************************/

func delayDispatch(delayTimeInSec:Double, inThread:dispatch_queue_t, thingsTodo:()->()) {
    let dispatchDelayTime = dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(delayTimeInSec * Double(NSEC_PER_SEC))
    )

    dispatch_after(dispatchDelayTime, inThread, thingsTodo)
}

func delayDispatchInMainThread(delayTimeInSec:Double, thingsTodo:()->()) {
    delayDispatch(delayTimeInSec, inThread: MainThread, thingsTodo: thingsTodo)
}

func dispatchMain_sync(delayTimeInSec:Double = 0.0, thingsTodo:()->()) {
    delayDispatchInMainThread(delayTimeInSec, thingsTodo: thingsTodo)
}

func delayDispatchInBackgroundThread(delayTimeInSec:Double, thingsTodo:()->()) {
    delayDispatch(delayTimeInSec, inThread: BackgroundThread, thingsTodo: thingsTodo)
}

func dispatchBackground_async(thingsTodo:()->()) {
    dispatch_async(BackgroundThread, thingsTodo)
}

func dispatchUserInitiated_async(thingsTodo:()->()) {
    dispatch_async(UserInitiatedThread, thingsTodo)
}

func dispatchMain_async(thingsTodo:()->()) {
    dispatch_async(MainThread, thingsTodo)
}

