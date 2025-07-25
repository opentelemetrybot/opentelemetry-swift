/**
 * Autogenerated by Thrift Compiler (0.13.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#if !os(watchOS) && !os(visionOS)

  import Foundation

  import Thrift

  public enum TagType: TEnum {
    case string
    case double
    case bool
    case long
    case binary
    case unknown(Int32)

    public static func read(from proto: TProtocol) throws -> TagType {
      let raw: Int32 = try proto.read()
      let new = TagType(rawValue: raw)
      if let unwrapped = new {
        return unwrapped
      } else {
        throw TProtocolError(error: .invalidData,
                             message: "Invalid enum value (\(raw)) for \(TagType.self)")
      }
    }

    public init() {
      self = .string
    }

    public var rawValue: Int32 {
      switch self {
      case .string: return 0
      case .double: return 1
      case .bool: return 2
      case .long: return 3
      case .binary: return 4
      case let .unknown(value): return value
      }
    }

    public init?(rawValue: Int32) {
      switch rawValue {
      case 0: self = .string
      case 1: self = .double
      case 2: self = .bool
      case 3: self = .long
      case 4: self = .binary
      default: self = .unknown(rawValue)
      }
    }
  }

  public enum SpanRefType: TEnum {
    case child_of
    case follows_from
    case unknown(Int32)

    public static func read(from proto: TProtocol) throws -> SpanRefType {
      let raw: Int32 = try proto.read()
      let new = SpanRefType(rawValue: raw)
      if let unwrapped = new {
        return unwrapped
      } else {
        throw TProtocolError(error: .invalidData,
                             message: "Invalid enum value (\(raw)) for \(SpanRefType.self)")
      }
    }

    public init() {
      self = .child_of
    }

    public var rawValue: Int32 {
      switch self {
      case .child_of: return 0
      case .follows_from: return 1
      case let .unknown(value): return value
      }
    }

    public init?(rawValue: Int32) {
      switch rawValue {
      case 0: self = .child_of
      case 1: self = .follows_from
      default: self = .unknown(rawValue)
      }
    }
  }

  public final class Tag {
    public var key: String

    public var vType: TagType

    public var vStr: String?

    public var vDouble: Double?

    public var vBool: Bool?

    public var vLong: Int64?

    public var vBinary: Data?

    public init(key: String, vType: TagType) {
      self.key = key
      self.vType = vType
    }

    public init(key: String, vType: TagType, vStr: String?, vDouble: Double?, vBool: Bool?, vLong: Int64?, vBinary: Data?) {
      self.key = key
      self.vType = vType
      self.vStr = vStr
      self.vDouble = vDouble
      self.vBool = vBool
      self.vLong = vLong
      self.vBinary = vBinary
    }
  }

  public final class Log {
    public var timestamp: Int64

    public var fields: TList<Tag>

    public init(timestamp: Int64, fields: TList<Tag>) {
      self.timestamp = timestamp
      self.fields = fields
    }
  }

  public final class SpanRef {
    public var refType: SpanRefType

    public var traceIdLow: Int64

    public var traceIdHigh: Int64

    public var spanId: Int64

    public init(refType: SpanRefType, traceIdLow: Int64, traceIdHigh: Int64, spanId: Int64) {
      self.refType = refType
      self.traceIdLow = traceIdLow
      self.traceIdHigh = traceIdHigh
      self.spanId = spanId
    }
  }

  public final class Span {
    public var traceIdLow: Int64

    public var traceIdHigh: Int64

    public var spanId: Int64

    public var parentSpanId: Int64

    public var operationName: String

    public var references: TList<SpanRef>?

    public var flags: Int32

    public var startTime: Int64

    public var duration: Int64

    public var tags: TList<Tag>?

    public var logs: TList<Log>?

    public init(traceIdLow: Int64, traceIdHigh: Int64, spanId: Int64, parentSpanId: Int64, operationName: String, flags: Int32, startTime: Int64, duration: Int64) {
      self.traceIdLow = traceIdLow
      self.traceIdHigh = traceIdHigh
      self.spanId = spanId
      self.parentSpanId = parentSpanId
      self.operationName = operationName
      self.flags = flags
      self.startTime = startTime
      self.duration = duration
    }

    public init(traceIdLow: Int64, traceIdHigh: Int64, spanId: Int64, parentSpanId: Int64, operationName: String, references: TList<SpanRef>?, flags: Int32, startTime: Int64, duration: Int64, tags: TList<Tag>?, logs: TList<Log>?) {
      self.traceIdLow = traceIdLow
      self.traceIdHigh = traceIdHigh
      self.spanId = spanId
      self.parentSpanId = parentSpanId
      self.operationName = operationName
      self.references = references
      self.flags = flags
      self.startTime = startTime
      self.duration = duration
      self.tags = tags
      self.logs = logs
    }
  }

  public final class Process {
    public var serviceName: String

    public var tags: TList<Tag>?

    public init(serviceName: String) {
      self.serviceName = serviceName
    }

    public init(serviceName: String, tags: TList<Tag>?) {
      self.serviceName = serviceName
      self.tags = tags
    }
  }

  public final class Batch {
    public var process: Process

    public var spans: TList<Span>

    public init(process: Process, spans: TList<Span>) {
      self.process = process
      self.spans = spans
    }
  }

  public final class BatchSubmitResponse {
    public var ok: Bool

    public init(ok: Bool) {
      self.ok = ok
    }
  }

  public protocol Collector {
    ///
    /// - Parameters:
    ///   - batches:
    /// - Returns: TList<BatchSubmitResponse>
    /// - Throws:
    func submitBatches(batches: TList<Batch>) throws -> TList<BatchSubmitResponse>
  }

  open class CollectorClient: TClient /* , Collector */ {}

  public protocol CollectorAsync {
    ///
    /// - Parameters:
    ///   - batches:
    ///   - completion: TAsyncResult<TList<BatchSubmitResponse>> wrapping return and following Exceptions:
    func submitBatches(batches: TList<Batch>, completion: @escaping (TAsyncResult<TList<BatchSubmitResponse>>) -> Void)
  }

  open class CollectorAsyncClient<Protocol: TProtocol, Factory: TAsyncTransportFactory>: TAsyncClient<Protocol, Factory> /* , Collector */ {}

  open class CollectorProcessor /* Collector */ {
    typealias ProcessorHandlerDictionary = [String: (Int32, TProtocol, TProtocol, Collector) throws -> Void]

    public var service: Collector

    public required init(service: Collector) {
      self.service = service
    }
  }

#endif
