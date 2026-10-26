<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS%2016%2B%20%7C%20macOS%2013%2B-blue" alt="Platform">
  <img src="https://img.shields.io/badge/Swift-5.9%2B-orange" alt="Swift">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License">
  <img src="https://img.shields.io/badge/status-early%20WIP-yellow" alt="Status">
  <a href="https://buymeacoffee.com/jcbuilds"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-FFDD00?logo=buymeacoffee&logoColor=black" alt="Buy Me a Coffee"></a>
</p>

<h1 align="center">✨ Apparition</h1>

<p align="center">
  <strong>One SwiftUI modifier that gives any view AI superpowers.</strong><br>
  <em><code>.aiAware()</code> — and you're done.</em>
</p>

<p align="center">
  Long-press any view • Ask, summarize, rewrite, translate • Zero plumbing
</p>

---

Apparition is a single SwiftUI view modifier — `.aiAware()` — that gives every view in your app a long-press gesture wired up to a local LLM. Apparition reads the view's accessibility tree, captures its visible text and structure, and offers a context-aware sheet of actions: *Ask*, *Summarize*, *Rewrite*, *Translate*, *Define*, *Action items*, *Custom prompt*.

You write zero glue code. The whole public API is one modifier.

```swift
ProductCard(product).aiAware()
```

## Why this is novel

Every other "AI in your iOS app" path requires you to hand-build context for every prompt — copy text, decide what to include, write a system prompt, wire up a sheet, handle streaming. Apparition uses the **accessibility tree** as the single source of truth for "what is this view about," so any well-built SwiftUI view becomes AI-aware for free. It's the AI equivalent of `.onTapGesture` — a primitive that should have always existed.

## Planned features

| Category | Capabilities |
|----------|-------------|
| 🪄 **One modifier** | `.aiAware()` is the entire public API |
| 🌳 **Accessibility-aware** | Snapshots the surrounding view's a11y tree as prompt context |
| 🎬 **Action library** | Ask, Summarize, Rewrite, Translate, Define, Extract, Custom — all overridable |
| 🧠 **BYO model** | Plug in any [Kuzco](https://github.com/haplollc/Kuzco) session, Apple Foundation Models, or your own engine |
| 📺 **Streaming UI** | Built-in result sheet streams tokens with diff-style highlights for rewrites |
| 🛠️ **Custom actions** | Add app-specific actions ("Add to grocery list", "Log workout") with a few lines |
| 🌗 **Light footprint** | No global state, no singletons, no swizzling |

## Planned API (subject to change)

```swift
import Apparition

// 1. Configure once, anywhere
Apparition.configure(engine: myKuzcoEngine)

// 2. Sprinkle on any view
struct ArticleView: View {
    let article: Article
    var body: some View {
        ScrollView {
            Text(article.body)
        }
        .aiAware()             // 👈 long-press for AI actions
    }
}

// 3. Or scope to specific actions
.aiAware(actions: [.summarize, .translate(.spanish), .custom("Tweet this")])
```

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/haplollc/Apparition.git", from: "0.1.0")
]
```

## Status

🚧 **Early WIP.** First target: the `.aiAware()` modifier with built-in summarize/rewrite/translate actions, backed by a pluggable engine protocol.

## License

MIT © [Haplo LLC](https://haplo.ai)
