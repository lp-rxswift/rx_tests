import XCTest
import RxSwift
import RxCocoa
import RxTest
@testable import Testing

class TestingViewModel : XCTestCase {
  var viewModel: ViewModel!
  var scheduler: ConcurrentDispatchQueueScheduler!

  override func setUp() {
    super.setUp()
    viewModel = ViewModel()
    scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
  }

  func testColorIsRedWhenHexStringIsFF0000_async() {
    let disposeBag = DisposeBag()
    let expect = expectation(description: #function)
    let expectedColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    var result: UIColor!
  }
}
