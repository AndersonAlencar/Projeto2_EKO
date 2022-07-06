import Foundation

public protocol ViewCode: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func configureStyles()
    func buildLayout()
}

public extension ViewCode {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
        configureStyles()
    }

    func configureViews() { }

    func configureStyles() { }
}
