//
//  MainPresenterTest.swift
//  MVPTests
//
//  Created by Денис Холодков on 30.09.2022.
//

import XCTest
@testable import MVP // модуль, что бы два target видели друг друга нужно import сделать

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MainPresenterTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!


// когда будут создоваться тесты, будут вызываться объекты в этом методе setUpWithError()
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }


// этот метод срабатывает, когда заканчивается наш тест, принято нилить объекты, что бы не было проблем (нужно разобраться, что за проблемы)
    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testModuleIsNotNil() { // что бы слева появился знак, нужно тестовый метод назвать test
        XCTAssertNotNil(view, "view is not nil") // проверка на nil
        XCTAssertNotNil(person, "person is not nil") // проверка на nil
        XCTAssertNotNil(presenter, "presenter is not nil") // проверка на nil
    }

    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }

    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // MARK: - measure используется, что бы замерять производительность
//        }
//    }

}
