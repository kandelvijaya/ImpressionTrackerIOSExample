# ImpressionTrackerIOSExample
Example app for impression tracking on ios


## Use Case
Get a callback when the view/cell is on screen completely [PRECONDITION] for 2 seconds [THRESHHOLD_TIME]; wherby the callback can be used
to debug, print, track or perform any potential action. 

## Some Key Concepts
The example uses `CADisplayLink` class for timer instead of `NSTimer` or `DispatchQueue`. `CADisplayLink` is both effecient and best 
suited for impression tracking as we receive the callback which is synced with screen refresh rate. 

- ImpressionTracker.swift
- Cell.swift
