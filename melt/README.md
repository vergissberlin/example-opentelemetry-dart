
## Tracing

### Create span with CURL

```bash
curl -i http://localhost:4318/v1/traces -X POST -H "Content-Type: application/json" -d @span.json
```

## Network

### Network communication with iOS, Android and macOS

You need to add:
```xml
    <key>com.apple.security.network.client</key>
    <true/>
```
to `macos/Runner/DebugProfile.entitlements` and 
`macos/Runner/Release.entitlements`.

This is documented here.

https://docs.flutter.dev/data-and-backend/networking#macos

