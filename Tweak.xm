#import "Tweak.h"

%hook SBFFluidBehaviorSettings
// Lower value = Higher speed
// Makes app opening and reachability opening faster. Might do other things im not sure
- (void)setResponse:(double)arg0 { %orig(arg0 / speed); }
%end

%hook SBFAnimationSettings
// Higher value = Higher speed
// Makes opening app library, today view, and spotlight faster. Might do other things im not sure
- (void)setSpeed:(double)arg0 { %orig(arg0 * speed); }
%end

%hook SBFWakeAnimationSettings
// Lower value = Higher speed
// Makes turning the screen on and off faster
// setBacklightFadeDuration doesn't work. Why? I have no fucking clue.
- (double)backlightFadeDuration { return %orig / speed; }
%end

// Preferences
static void loadPreferences() {
	NSUserDefaults *preferences = [[NSUserDefaults alloc] initWithSuiteName:@"dev.callmeecho.speedyanims.preferences"];
	if (!preferences) return;
	speed = [[preferences objectForKey:@"speed"] integerValue];
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("dev.callmeecho.speedyanims.preferences/reload"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPreferences();
}
