test:
	make travis | xcpretty -c
travis:
	xcodebuild \
		-sdk iphonesimulator \
		-workspace iOSxTDD.xcworkspace \
		-scheme iOSxTDDTests \
		-configuration Debug \
		clean test \
		ONLY_ACTIVE_ARCH=NO \
		TEST_AFTER_BUILD=YES