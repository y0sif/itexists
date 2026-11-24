# Examples

These are real itexists runs in Claude Code from November 2026, copied as the agent printed them. The only edits: the trailing source list the search tool adds is removed (the table already links every source), and a dash in one table cell became `n/a`. The web changes, so a run today can find different things.

## A whole app

```text
/itexists a habit tracker app for Android with streaks and reminders, no account needed
```

Run from an empty folder.

### itexists: offline Android habit tracker with streaks and reminders

**Verdict: USE IT, [Loop Habit Tracker](https://github.com/iSoron/uhabits).** It already does all three things you asked for: streaks, a separate reminder for each habit, and no internet connection or account needed. It's also free, has no ads, and is open source. At least five other open-source apps on F-Droid do the same.

You described a free Android habit tracker that logs streaks, sends reminders and keeps all data on the phone with no sign-up. That isn't a gap. It's a crowded category on F-Droid.

| What | Type | Status | Price | Covers | Missing |
|---|---|---|---|---|---|
| [Loop Habit Tracker](https://github.com/iSoron/uhabits) | open source (GPL-3.0) | active: v2.3.1 on [F-Droid](https://f-droid.org/packages/org.isoron.uhabits/) Aug 2025; [IzzyOnDroid](https://apt.izzysoft.de/ftp/repo/fdroid/index/apk/org.isoron.uhabits?repo=main) lists 2.3.2 | free, no ads, no in-app purchases | Streaks, a habit "score", one reminder per habit, flexible schedules ("3 times per week"), widgets, CSV/SQLite export. 10.4k stars, not archived | Plain design, little gamification; run by volunteers |
| [Streak](https://f-droid.org/packages/com.streak.app/) | open source (GPL-3.0) | active: v2.10.0, Nov 23 2026 | free, donations | Current and best streaks, reminders on the days you pick, "second chances" when you miss a day, Pomodoro timer, JSON backup | Asks for many permissions (all-files storage access, step counts) |
| [Frequent Habits](https://f-droid.org/packages/com.frequent.habits/) | open source (MIT) | active: v2.3.5, Oct 29 2026 | free, donations | Heatmaps, trophies, focus timer, widget, offline JSON backup | The listing doesn't describe reminders, though it asks for alarm permissions |
| [Constanza](https://f-droid.org/packages/com.jjrapps.constanza/) | open source | not opened | free | Answer habit reminders from the notification without opening the app; no internet permission at all | not checked |
| [Habitt](https://play.google.com/store/apps/details?id=com.shellz.habitt) | app (Google Play) | not opened | not checked | Offline-first, no login, optional encrypted Google Drive backup | not checked |
| Grit, Table Habit, Life RPG and about 25 more | open source | not opened | not checked | Listed in the [F-Droid habit tracker category](https://f-droid.org/en/categories/habit-tracker/) (page 1 of 2) | not checked |

- **Searched:** 5 searches and 4 pages read, covering F-Droid, GitHub, Google Play, Product Hunt, blog roundups and Google's Digital Wellbeing docs. No Reddit threads came up.
- **Platform:** **Android doesn't ship a habit tracker with streaks.** Digital Wellbeing only covers screen time: app limits, screen time reminders and the announced "Pause Point".
- **Graveyard:** none found. Loop isn't archived and shows no deprecation notice. Its main risk is that it depends on volunteers.
- **Gap:** none found. Apps already compete on extras like gamification, a focus timer or answering from the notification. "Mine will look nicer" doesn't count as a gap unless you can name what's concretely missing.

Building it to learn? Go ahead, but study [Loop Habit Tracker](https://github.com/iSoron/uhabits) first: its scoring logic and reminder scheduling are the parts worth copying.

**Next step:** Should I write out the install steps for Loop? That means getting the F-Droid client and installing `org.isoron.uhabits`, which keeps it updated (the README notes APKs from the GitHub releases page don't update themselves), or installing it from Google Play. If you'd like more gamification, I can do the same for Streak.

## A feature in your project

```text
/itexists rate limit each API key to 100 requests a minute
```

Run inside a small Express 5 API whose clients send an `x-api-key` header. itexists read its `package.json` and README to learn the stack.

### itexists: rate limit each API key to 100 requests a minute

**Verdict: USE IT, [express-rate-limit](https://github.com/express-rate-limit/express-rate-limit).** It's maintained, and its documented `keyGenerator` option accepts any per-client identifier, including an API key. With `limit: 100, windowMs: 60000` it does what you asked.

You want each `x-api-key` in your Express 5 notes-api to get 100 requests a minute. Today it has auth but no limit at all.

| What | Type | Status | Price | Covers | Missing |
|---|---|---|---|---|---|
| [express-rate-limit](https://github.com/express-rate-limit/express-rate-limit) | library | active: v8.7.5 marked Latest, released "18 Nov" (the page shows no year) | free, MIT | Express middleware. `keyGenerator(req, res)` returns your key. `limit` and `windowMs` set the rate. Memory store by default, external stores optional. | The pages I read never mention Express 5. The only sign of support is a search snippet showing its peer dependency includes `5`. The memory store is per-process. |
| [rate-limiter-flexible](https://github.com/animir/node-rate-limiter-flexible) | library | active: v11.5.0, released "15 Nov" (no year shown) | free, ISC | `consume(anyString)` works with any key. Stores: Memory, Redis, Valkey, Postgres, Mongo, SQLite and more. | It isn't ready-made Express middleware, so you write a small wrapper (the README points to a wiki page for this). |
| [Arcjet](https://docs.arcjet.com/rate-limiting/reference/nodejs) | SaaS | not opened | not checked | Search snippet: a fixed-window rule keyed on the `x-api-key` header | An external service, which is more than this app needs |
| Hand-rolled `Map` counter | workaround | n/a | free | About 15 lines of code | You'd have to handle window resets, headers and memory cleanup yourself, and the library already does that |

- **Searched:** 4 searches and 6 pages read: the express-rate-limit readme, its GitHub repo, releases page and configuration docs, plus the rate-limiter-flexible repo and releases page. The npm page for rate-limiter-flexible returned 403.
- **Platform:** **Neither Express 5 nor Node core ships a rate limiter.** Searches found none, though I didn't confirm that in the official Express docs.
- **Graveyard:** not checked. This problem is solved, not abandoned.
- **Gap:** none found. Two things to know:
  - Mount the limiter **after** your auth middleware. Then only valid keys get counted, and bad keys get a 401 before they reach it.
  - The default memory store resets when the process restarts and isn't shared between processes. That's fine for one process. With several instances you'd need a Redis store.

Building it to learn? Build it, and study express-rate-limit first.

**Next step:** Should I run `npm install express-rate-limit` and add the limiter to `src/server.js` after the auth check? It would be keyed on `req.get("x-api-key")` with `limit: 100, windowMs: 60_000` and `standardHeaders: "draft-8"`, so over-limit requests get a 429.

## itexists, on itself

```text
/itexists an agent skill you run before building something: it searches the web for apps, tools or features that already do it, and tells you whether to use one, extend one, or build your own
```

Run from an empty folder, with itexists itself loaded.

### itexists: agent skill that checks prior art before building

**Verdict: BUILD THE GAP, next to [search-first](https://raw.githubusercontent.com/affaan-m/ECC/main/skills/search-first/SKILL.md).** Agent skills that decide "adopt / extend / build" already exist, but every one I read checks code libraries, packages or agent tools. None checks whole products, app stores, platform built-ins or dead projects, and none requires a live web search.

The idea: a skill your coding agent runs before you build anything, from an app down to a single feature. It searches the live web across stores, repos, platform docs and dead projects, then returns a one-screen verdict for developers using AI agents.

| What | Type | Status | Price | Covers | Missing |
|---|---|---|---|---|---|
| [search-first (ECC)](https://raw.githubusercontent.com/affaan-m/ECC/main/skills/search-first/SKILL.md) | open source skill | no date shown on the page | free | Searches npm/PyPI, MCP servers, local skills and GitHub, then picks Adopt / Extend / Compose / Build | Libraries only. Falls back to local-only checks. No app stores, platform built-ins or dead projects |
| [programming-advisor](https://www.claudepluginhub.com/plugins/gaupoit-programming-advisor) | open source plugin | v1.2.1, last commit Dec 31, 2025 | free (MIT), price not stated | Build vs buy across packages, open source and SaaS, with cost-of-ownership estimates | Uses bundled static reference files, not live search |
| [skill-hunter](https://dev.to/turacthethinker/stop-your-ai-agent-from-building-tools-that-already-exist-6o9) | open source plugin | posted "Apr 26" (year not shown) | not stated | Scans MCP servers, CLIs, packages, APIs and GitHub. Scores candidates and recommends reuse / adapt / build | Aimed at coding tasks, not product ideas |
| [claude-oracle](https://skills.sh/vvkmnn/claude-oracle-mcp/claude-oracle) | MCP server + skill | first seen Feb 24, 2026, 3 stars | not stated | Searches 15,000+ MCP servers, plugins and skills across 19 sources | Agent tools only. Returns a ranked list, no verdict |
| [IdeaProof](https://alternativeto.net/software/ideaproof-io/about) and [other idea validators](https://alternativeto.net/browse/all/?tag=idea-validation) | SaaS | not opened | not opened | Competitor and market scoring for startup ideas | Separate web apps, not inside your agent. Market framing, not "use / extend / build" |
| [Claude Code plan mode](https://academy.claude.com/courses/ai-native-sdlc-playbook/plan-mode) | built-in | not opened | included | Read-only research and planning before coding | Explores your codebase, not the outside world |

- **Searched:** 7 searches and 5 pages read, across GitHub, skill registries (skills.sh, Tessl, ClaudePluginHub), dev.to, Product Hunt, AlternativeTo and plan-mode write-ups. My GitHub API calls for stars and recent commits were blocked, so freshness comes only from the listing pages.
- **Platform:** **Claude Code does not ship this.** Plan mode researches your codebase, not existing products. I found no announcement of a built-in version.
- **Graveyard:** nothing found. My one search returned only SEO and marketing tools.
- **Gap:** product-level coverage (app stores, Product Hunt, extension stores, platform changelogs, dead projects), a rule that every claim must come from a live search, and one forced verdict, including "dig first" when someone built it and stopped. The search-first family handles the library-level half well.

Your SKILL.md already covers this gap. The closest neighbours are search-first and skill-hunter. They overlap with you on the decision at the library level, so the honest pitch is "search-first for products and features", not "the first prior-art skill". Patent-focused "prior art search" skills also exist under that name ([example](https://claudemarketplaces.com/skills/robthepcguy/claude-patent-creator/prior-art-search)), so avoid that phrase in your description.

**Next step:** Shall I read search-first and skill-hunter in full and list where they overlap with your SKILL.md, so the README can say clearly what itexists adds?
