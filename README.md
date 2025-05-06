# Swift LRU Cache

**swift-lru-cache** is a lightweight and efficient in-memory Least Recently Used (LRU) cache implementation in Swift. It helps manage memory usage by automatically removing the least recently accessed items when the cache exceeds a predefined size.

## 🚀 Features

- Simple and easy-to-use API
- Thread-safe (if applicable)
- Automatic eviction of least recently used items
- Written in pure Swift
- Customizable capacity

## 🛠 Use Cases

- Caching API responses
- Image caching in Swift apps
- Temporary storage with eviction logic
- Reusable for iOS/macOS/tvOS/watchOS apps

## 📦 Installation

### Swift Package Manager

To integrate using Swift Package Manager, add this to your `Package.swift`:

```swift
.package(url: "https://github.com/AnilMakhija/swift-lru-cache.git", from: "1.0.0"),
```

Then add `"LRUCache"` to your target dependencies.

## 🧪 Example

```swift
let cache = LRUCache<String, String>(capacity: 3)
cache.put("a", value: "Apple")
cache.put("b", value: "Banana")
cache.put("c", value: "Cherry")
print(cache.get("a")) // Apple
cache.put("d", value: "Date") // Evicts "b"
print(cache.get("b")) // nil
```

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙌 Author

Made by [Anil Makhija](https://github.com/AnilMakhija) with ❤️  
Visit the repo 👉 [swift-lru-cache](https://github.com/AnilMakhija/swift-lru-cache)
