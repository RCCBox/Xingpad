###Coding guidelines

##### Architecture

**Atomicity**

Keep your classes as atomic as possible. Avoid bloated implementation files wherever possible by factoring out functionality into its own classes or better categories.

**Subclasses**

Whenever possible, avoid subclassing and use categories instead.

**Singletons**

Incautious use of singletons breaks the principles of object orientated programming (like decoupling, atomicity and so on). They must therefore not be used except absolutely necessary. When sticking to cocoa design patterns singletons will be hardly necessary. Whenever a singleton seems inevitable the code must be restructured appropriately to circumvent this need.

**Properties**

All class variables must be declared as properties using the @property directive and automated synthesizing. The ivar must always be accessed using the synthesized getter and setter methods. Direct access of ivars may only happen for good reason like custom getter/setter methods.

#####Project Organization

Directory tree must reflect file tree in Xcode.

Third party classes in Vendor folder in project root. Submodules. Import only necessary files in Xcode.

Separate folders for Model, View, ViewControllers

##### Codestyle

**Naming conventions**

* Always, always name you methods according to Cocoa naming conventions. Exceptions are not allowed. Never.
* Constants start with a lower "k" followed by class name and constant name. Example: <code>kXPPossibleActionsStringComment = @"COMMENT";</code>

**Import directives**

Separate import directives with comments by Categories, Model, View, ViewController and App classes as well as Vendor and Apple classes.
Example: MyViewController.m

	// Apple
	#import <UIKit/UIKit.h>
	
	// Vendor
	// Categories
	#import "NSArray+RubyLikeArrayAdditions.h"
	// Model
	#import "BlockObservationStuff.h"
	// Views
	#import "FanyBadgeView.h"
	// Viewcontrollers
	#import "StackingViewController.h"
	
**Protocols**

Always implement protocols in its own category. Example:

MyViewController.h:

	@interface MyViewController(UITableViewMethods) <UITableViewDataSource, UITableViewDelegate>
	@end

MyViewController.m:

	@implementation MyViewController(UITableViewMethods)
	@end
	
**Private methods**

Private methods need to be wrapped in its own category. Example:

MyViewController.m:

	@implementation MyViewController(Private)
	@end

	@implementation MyViewController
	@end

**Preprocessor macros**

Preprocessor should be avoided. The compiler can't do any checking or validation on macros. Hence bugs are more difficult to discover.

Constant strings must be declared like this in order to avoid the #define directive:

	static NSString* const kRCCCredentialsKey = @"rccCredentials";


##### Documentation

**Structure**

Structure you code in several levels as using different kinds of comments.

1.	Implementation blocks: <code>#pragma mark - Template methods</code>

	Sort methods according to these categories:
	* Initialization
	* Template methods
	* Dealloc
	
	

2.	Methods:

	dfdfdfdf

3.	Code comments: <code>// Iterate over returned objects</code>

	dfdfdfd
	
Sample:

	sfndfdf

**Comments**

Parts of code that need to be attended to at a later point must be commented using one of the following tags. Take care to use the exact spelling because when spelled correctly and followed by a colon they show up in Xcode's method overview.

	// TODO: Refactor this into its own method
	// FIXME: Crashing with nil parameter
	// ???: What is this math stuff doing?