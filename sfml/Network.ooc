import sfml/System

include SFML/Network
use csfml-network

sfSocketStatus: extern cover

SocketUDP: cover from sfSocketUDP* {
    new: extern(sfSocketUDP_Create) static func -> SocketUDP
    destroy: extern(sfSocketUDP_Destroy) func
    setBlocking: extern(sfSocketUDP_SetBlocking) func (blocking: Bool)
    bind: extern(sfSocketUDP_Bind) func (port: UShort) -> Bool
    unbind: extern(sfSocketUDP_Unbind) func -> Bool
    send: extern(sfSocketUDP_Send) func (data: Char*, size: SizeT, address: IPAddress, port: UShort) -> sfSocketStatus
    receive: extern(sfSocketUDP_Receive) func (data: Char*, maxSize: SizeT, sizeReceived: SizeT*, address: IPAddress, port: UShort*) -> sfSocketStatus
    sendPacket: extern(sfSocketUDP_SendPacket) func (packet: Packet, address: IPAddress, port: UShort) -> sfSocketStatus
    receivePacket: extern(sfSocketUDP_ReceivePacket) func (packet: Packet, address: IPAddress, port: UShort*) -> sfSocketStatus
    isValid: extern(sfSocketUDP_IsValid) func -> Bool
}

SocketTCP: cover from sfSocketTCP* {
    new: extern(sfSocketTCP_Create) static func -> SocketTCP
    destroy: extern(sfSocketTCP_Destroy) func
    setBlocking: extern(sfSocketTCP_SetBlocking) func (blocking: Bool)
    connect: extern(sfSocketTCP_Connect) func (port: UShort, hostAddress: IPAddress, timeout: Float) -> sfSocketStatus
    listen: extern(sfSocketTCP_Listen) func (port: UShort) -> Bool
    accept: extern(sfSocketTCP_Accept) func (connected: SocketTCP*, address: IPAddress) -> sfSocketStatus
    send: extern(sfSocketTCP_Send) func (data: Char*, size: SizeT) -> sfSocketStatus
    receive: extern(sfSocketTCP_Receive) func (data: Char*, maxSize: SizeT, sizeReceived: SizeT*) -> sfSocketStatus
    sendPacket: extern(sfSocketTCP_SendPacket) func (packet: Packet) -> sfSocketStatus
    receivePacket: extern(sfSocketTCP_ReceivePacket) func (packet: Packet) -> sfSocketStatus
    isValid: extern(sfSocketTCP_IsValid) func -> Bool
}

SelectorUDP: cover from sfSelectorUDP* {
    new: extern(sfSelectorUDP_Create) static func -> SelectorUDP
    destroy: extern(sfSelectorUDP_Destroy) func
    add: extern(sfSelectorUDP_Add) func (socket: SocketUDP)
    remove: extern(sfSelectorUDP_Remove) func (socket: SocketUDP)
    clear: extern(sfSelectorUDP_Clear) func
    wait: extern(sfSelectorUDP_Wait) func (timeout: Float) -> UInt
    getSocketReady: extern(sfSelectorUDP_GetSocketReady) func (index: UInt) -> SocketUDP
}

SelectorTCP: cover from sfSelectorTCP* {
    new: extern(sfSelectorTCP_Create) static func -> SelectorTCP
    destroy: extern(sfSelectorTCP_Destroy) func
    add: extern(sfSelectorTCP_Add) func (socket: SocketTCP)
    remove: extern(sfSelectorTCP_Remove) func (socket: SocketTCP)
    clear: extern(sfSelectorTCP_Clear) func
    wait: extern(sfSelectorTCP_Wait) func (timeout: Float) -> UInt
    getSocketReady: extern(sfSelectorTCP_GetSocketReady) func (index: UInt) -> SocketTCP
}

IPAddress: cover from sfIPAddress {
    new: extern(IPAddress_FromString) static func ~string (string: Char*) -> IPAddress
    new: extern(IPAddress_FromBytes) static func ~bytes (byte0: UInt8, byte1: UInt8, byte2: UInt8, byte3: UInt8) -> IPAddress
    new: extern(IPAddress_FromInteger) static func ~integer (address: UInt32) -> IPAddress
    isValid: extern(IPAddress_IsValid) func -> Bool
    toString: extern(IPAddress_ToString) func (string: Char*)
    toInteger: extern(IPAddress_ToInteger) func -> UInt32
    getLocalAddress: extern(IPAddress_GetLocalAddress) static func -> IPAddress
    getPublicAddress: extern(IPAddress_GetPublicAddress) static func (timeout: Float) -> IPAddress
    localHost: extern(IPAddress_LocalHost) static func -> IPAddress
}

WChar: cover from wchar_t

Packet: cover from sfPacket* {
    new: extern(sfPacket_Create) static func -> Packet
    destroy: extern(sfPacket_Destroy) func
    append: extern(sfPacket_Append) func (data: Void*, sizeInBytes: SizeT)
    clear: extern(sfPacket_Clear) func
    getData: extern(sfPacket_GetData) func -> Char*
    getDataSize: extern(sfPacket_GetDataSize) func -> SizeT
    endOfPacket: extern(sfPacket_EndOfPacket) func -> Bool
    canRead: extern(sfPacket_CanRead) func -> Bool
    readBool: extern(sfPacket_ReadBool) func -> Bool
    readInt8: extern(sfPacket_ReadInt8) func -> Int8
    readUint8: extern(sfPacket_ReadUint8) func -> UInt8
    readInt16: extern(sfPacket_ReadInt16) func -> Int16
    readUint16: extern(sfPacket_ReadUint16) func -> UInt16
    readInt32: extern(sfPacket_ReadInt32) func -> Int32
    readUint32: extern(sfPacket_ReadUint32) func -> UInt32
    readFloat: extern(sfPacket_ReadFloat) func -> Float
    readDouble: extern(sfPacket_ReadDouble) func -> Double
    readString: extern(sfPacket_ReadString) func (string: Char*)
    readWideString: extern(sfPacket_ReadWideString) func (string: WChar*)
    writeBool: extern(sfPacket_WriteBool) func (arg1: Bool)
    writeInt8: extern(sfPacket_WriteInt8) func (arg1: Int8)
    writeUint8: extern(sfPacket_WriteUint8) func (arg1: UInt8)
    writeInt16: extern(sfPacket_WriteInt16) func (arg1: Int16)
    writeUint16: extern(sfPacket_WriteUint16) func (arg1: UInt16)
    writeInt32: extern(sfPacket_WriteInt32) func (arg1: Int32)
    writeUint32: extern(sfPacket_WriteUint32) func (arg1: UInt32)
    writeFloat: extern(sfPacket_WriteFloat) func (arg1: Float)
    writeDouble: extern(sfPacket_WriteDouble) func (arg1: Double)
    writeString: extern(sfPacket_WriteString) func (string: Char*)
    writeWideString: extern(sfPacket_WriteWideString) func (string: WChar*)
}
