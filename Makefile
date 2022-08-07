generate:
	tuist generate

clean:
	rm -rf .package.resolved
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	rm -rf .package.resolved
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
