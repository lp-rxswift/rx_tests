import XCTest
import RxSwift
import RxTest
import RxBlocking

class TestingOperators : XCTestCase {
  var scheduler: TestScheduler!
  var subscription: Disposable!

  override func setUp() {
    super.setUp()
    scheduler = TestScheduler(initialClock: 0)
  }

  override func tearDown() {
    scheduler.scheduleAt(1000) {
      self.subscription.dispose()
    }
    scheduler = nil
    super.tearDown()
  }

  func testAmb() {
    let observer = scheduler.createObserver(String.self)
    let observableA = scheduler
      .createHotObservable([.next(100, "a"),
                            .next(200, "b"),
                            .next(300, "c")])
    let observableB = scheduler
      .createHotObservable([.next(90, "1"),
                            .next(200, "2"),
                            .next(300, "3")])

    let ambObservable = observableA.amb(observableB)

    self.subscription = ambObservable.subscribe(observer)
    scheduler.start()

    let results = observer.events.compactMap {
      $0.value.element
    }

    XCTAssertEqual(results, ["1", "2", "3"])
  }
}
