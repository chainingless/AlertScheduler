# AlertScheduler

AlertScheduler is a painless tool to handle the display of multiple error messages at the same time.

# Usage

*Swift*
```swift
let item = AlertScheduleItem(title: "Title", message: "Message", buttonText: "Confirm")
AlertScheduler.shared.append(item: item)
```
*Objective-C*
```objective-c
AlertScheduleItem *item = [[AlertScheduleItem alloc] initWithTitle:@"Title" message:@"Message"];
[[AlertScheduler shared] appendWithItem:item];
```
