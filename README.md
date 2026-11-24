<div align="center">

# itexists

**It probably exists. An agent skill that checks the live web before you build an app, a tool, or a feature.**

[![CI](https://github.com/y0sif/itexists/actions/workflows/ci.yml/badge.svg)](https://github.com/y0sif/itexists/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Agent skill](https://img.shields.io/badge/agent-skill-blue)](skills/itexists/SKILL.md)

**[Install](#install) · [Use it](#use-it) · [What you get](#what-you-get) · [Examples](docs/examples.md) · [How it compares](#how-it-compares) · [FAQ](#faq)**

</div>

Same request, same agent:

<table>
<tr>
<th width="50%">Without itexists</th>
<th width="50%">With itexists</th>
</tr>
<tr>
<td valign="top">

> Build me a habit tracker app for Android with streaks and reminders, no account needed.

"I'll start by checking what's available in the environment for building Android apps."

Then it goes looking for Java, Gradle and the Android SDK.

</td>
<td valign="top">

> /itexists a habit tracker app for Android with streaks and reminders, no account needed

"**Verdict: USE IT, Loop Habit Tracker.** It already does all three things you asked for: streaks, a separate reminder for each habit, and no internet connection or account needed."

Then a table of five more, the platform check, and the install steps if you want them.

</td>
</tr>
</table>

The full report is in [the examples](docs/examples.md#a-whole-app).

## Install

itexists is one `SKILL.md` file. Install it with the [skills CLI](https://github.com/vercel-labs/skills), which works with Claude Code, Codex, Cursor, Gemini CLI, OpenCode and many other agents:

```bash
npx skills add y0sif/itexists
```

Add `-g` to install it for every project instead of the current one.

<details>
<summary>As a Claude Code plugin</summary>

```bash
claude plugin marketplace add y0sif/itexists
claude plugin install itexists@itexists
```

Plugin skills carry the plugin's name, so you call it as `/itexists:itexists`.

</details>

<details>
<summary>By hand</summary>

Copy [`skills/itexists/SKILL.md`](skills/itexists/SKILL.md) to `~/.claude/skills/itexists/SKILL.md`, or to your agent's skills folder.

</details>

## Use it

Call it with what you want to build, right before you build it:

```text
/itexists a habit tracker app for Android with streaks and reminders
/itexists rate limit each API key to 100 requests a minute
/itexists --deep a self-hosted wiki for a team of five
```

- **Whole things or features.** Ask about an app, a tool, a library, or a feature. For a feature, run it inside your project: it reads the manifest and README to learn your stack, and changes nothing.
- **`--deep`** searches about twice as much. Use it when the default run says the picture is still unclear.
- **Only when you call it.** It runs only when you ask for it by name. Your agent needs a web search tool; without one, itexists stops and says so.

## What you get

The report fits on one screen, with one verdict and one next step. It holds:

- the idea restated in one line
- a table of what exists, with links, status, price, and what each one is missing
- what was searched, whether your platform already ships it, and who tried and stopped
- the smallest gap nothing covers

| Verdict | Means |
|---|---|
| **USE IT** | Something maintained already does it. Here is how to get it running. |
| **EXTEND IT** | Something does most of it. Here is the plugin, config or pull request that adds the rest. |
| **BUILD THE GAP** | The core exists. Build only the missing slice, on top of it. |
| **BUILD IT** | Nothing close exists, or everything close fails a reason that matters (closed, cloud-only, wrong platform). |
| **DIG FIRST** | Someone built this and stopped. Read why before you start. |

With USE IT or EXTEND IT, it adds a line for anyone building to learn: build it anyway, and study the best existing project first.

It never installs anything, runs commands that change things, or posts anywhere until you say yes, and then only the exact command it showed you.

## How it looks at an idea

One phrasing finds one corner of the web, so itexists searches from several angles before it decides:

- your words, and the words someone with the problem would type
- how people get it done today without software, or with a spreadsheet
- whether the OS, framework or host app already ships it
- the words an implementer would use, and the neighboring field that solved it first
- launches from this year, and the projects that shut down

It reads the real pages (repos, store listings, docs) instead of trusting search snippets, and marks anything it did not open.

## We ran it on itself

Asked about itself, itexists said **BUILD THE GAP** next to ECC's search-first: skills that make that decision for libraries and packages exist, but none it read checks whole products, app stores, platform built-ins or dead projects. It missed [who-built-this-before-me](https://github.com/iagochavarry/who-built-this-before-me), the closest one we know of. [Full report](docs/examples.md#itexists-on-itself).

## How it compares

itexists is not the first skill of its kind. Its search method builds on who-built-this-before-me, with credit in [LICENSE](LICENSE). This is where it differs:

| Project | What it is | How itexists differs |
|---|---|---|
| [who-built-this-before-me](https://github.com/iagochavarry/who-built-this-before-me) | A skill that checks prior art across GitHub, Hacker News, Product Hunt and registries, with a similar verdict | Also searches app stores, platform built-ins and today's workarounds, handles features inside your project, and offers to set up what it found |
| [search-first](https://github.com/affaan-m/ECC) (ECC) | A skill that checks npm, PyPI, MCP servers and GitHub before you write code | Checks whole apps and products too, not only libraries |
| [idea-reality-mcp](https://github.com/mnemox-ai/idea-reality-mcp) | An MCP server that scores how crowded an idea is | No server to install, and it ends with use, extend, or build rather than a crowdedness score |
| [patent](https://docs.rs/crate/patent/latest) | A CLI that searches package registries, GitHub and Hacker News for an existing dev tool | Runs inside your agent, and covers more than dev tools |

## FAQ

**Does it cost anything when I am not using it?**
It costs nothing until you call it: Claude Code does not load it until then, so it adds nothing to your context. A run uses a handful of web searches and page reads from your normal usage.

**Can't I just ask my agent whether this exists?**
You can ask directly, and itexists makes the agent search from several angles, read the real pages, check your platform and the projects that shut down, and pick one verdict instead of listing options.

**Which agents does it work with?**
Any agent that loads `SKILL.md` skills and can search the web. The skills CLI installs it into each one.

**What if it misses something or gets it wrong?**
[Open a bad report](https://github.com/y0sif/itexists/issues/new?template=bad-report.yml) with what you asked and what it should have found.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
