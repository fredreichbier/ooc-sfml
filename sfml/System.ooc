include SFML/System
include SFML/System/Randomizer

use csfml-system

UInt32: cover from sfUint32
UInt8: cover from sfUint8

Mutex: cover from sfMutex* {
    new: extern(sfMutex_Create) static func -> Mutex
    destroy: extern(sfMutex_Destroy) func
    lock: extern(sfMutex_Lock) func
    unlock: extern(sfMutex_Unlock) func
}

Thread: cover from sfThread* {
    new: extern(sfThread_Create) static func (function: Func, userData: Void*) -> Thread
    destroy: extern(sfThread_Destroy) func
    launch: extern(sfThread_Launch) func
    wait: extern(sfThread_Wait) func
    terminate: extern(sfThread_Terminate) func
}

Clock: cover from sfClock* {
    new: extern(sfClock_Create) static func -> Clock
    destroy: extern(sfClock_Destroy) func
    getTime: extern(sfClock_GetTime) func -> Float
    reset: extern(sfClock_Reset) func
}

Random: cover {
    setSeed: extern(sfRandom_SetSeed) static func (seed: UInt)
    getSeed: extern(sfRandom_GetSeed) static func -> UInt
    float: extern(sfRandom_Float) static func (begin: Float, end: Float) -> Float
    int: extern(sfRandom_Int) static func (begin: Int, end: Int) -> Int
}

sleep: extern(sfSleep) func (duration: Float)

