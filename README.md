# T-animator

Small and simple tool's offering 3 nice animations for your tableView, cells.

Easily instantiate **T-animator** with your **UITableView**.
And perorm animations at **willDisplay cell: IndxPath**.

Or use our *TAnimatorTableViewController*.
Setup duration, delay and animatoin you would like to perform.

Use TAnimatorTableViewController.
Setup with your own configuration.
Small and easy, less than **300** lines of code.
```Swift

open class TAnimatorTableViewController: UITableViewController {
    
    // MARK: - Settings.
    
    /// Set and override default settings.
    public var settings: TAnimatorSettings = TAnimatorSettings(
        type: .bounceIn,
        duration: 0.7,
        delay: 0.3
    )
    
    // MARK: - UITableViewDelegate.
    
    open override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animation = TAnimatorFactory.makeAnimation(for: cell, at: indexPath, in: tableView)
        animation(settings)
    }
}
```

Or just create your own ...
```Swift
/// Create a TAnimator or simply create and perform an animation with TAnimatorSettings configuration.
open class TAnimatorFactory {
    
    static public func makeTanimator(using tableView: UITableView) -> TAnimator
    static public func makeAnimation(for cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) -> ((TAnimatorSettings) -> Void) 
}
```

Simple, easy to use.

#### Bounce in:

!["Bounce in animation"](bounceIn.gif)

#### Fade in:

!["Fade in animation"](fadeIn.gif)


## Setup

**pod 'T-animator', :git => 'https://github.com/maturada/T-animator'**

**import T_animator**
