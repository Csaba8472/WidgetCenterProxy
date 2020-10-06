using System;
using Foundation;
using Intents;
using ObjCRuntime;

namespace Binding
{
	// @interface WidgetCenterProxy : NSObject
	[iOS (14,0)]
	[BaseType (typeof(NSObject))]
	interface WidgetCenterProxy
	{
		// -(void)reloadTimeLinesOfKind:(NSString * _Nonnull)ofKind;
		[Export ("reloadTimeLinesOfKind:")]
		void ReloadTimeLinesOfKind (string ofKind);

		// -(void)reloadAllTimeLines;
		[Export ("reloadAllTimeLines")]
		void ReloadAllTimeLines ();

		// -(void)getCurrentConfigurationsWithCompletion:(void (^ _Nonnull)(NSArray<WidgetInfoProxy *> * _Nonnull))completion;
		[Export ("getCurrentConfigurationsWithCompletion:")]
		void GetCurrentConfigurationsWithCompletion (Action<NSArray<WidgetInfoProxy>> completion);
	}

	// @interface WidgetInfoProxy : NSObject
	[iOS (14,0)]
	[BaseType (typeof(NSObject))]
	interface WidgetInfoProxy : INativeObject
	{
		// @property (copy, nonatomic) NSString * _Nonnull kind;
		[Export ("kind")]
		string Kind { get; set; }

		// @property (nonatomic) NSInteger family;
		[Export ("family")]
		nint Family { get; set; }

		// @property (nonatomic, strong) INIntent * _Nullable configuration;
		[NullAllowed, Export ("configuration", ArgumentSemantic.Strong)]
		INIntent Configuration { get; set; }
	}
}
