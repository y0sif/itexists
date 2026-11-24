---
name: itexists
description: >-
  Check whether an app, tool, or feature already exists before you build it.
  Searches the live web from several angles, shows what is out there, and ends
  with one verdict and a next step. Run it only when the user calls /itexists.
argument-hint: "[deep] <what you want to build>"
disable-model-invocation: true
allowed-tools: WebSearch WebFetch
---

# itexists

The user wants to build something. Before they spend a weekend, or a week of tokens, find out what already exists. Most ideas exist in some form: solved well, solved badly, abandoned for a reason worth knowing, or still open. Find out which one this is and say it plainly.

## Rule zero: search the live web

Every claim comes from a search you ran or a page you read in this session, never from memory. Products, libraries and platform features ship every week, long after your training data ends. If you have no web search tool, stop and say so: ask the user to enable one or to paste results. Never present memory as research.

## 1. Pin down the idea

- The idea is the text after the command. If it is empty, use the idea under discussion in this conversation. If there is none, ask what they want to build, in one line, and wait.
- If the text starts with `deep`, use the deep budget (step 4).
- Restate the idea in one line: what it does, for whom, and the constraint that makes it different, if any.
- Decide the scope:
  - **A whole thing**: an app, a tool, a library, a service, a plugin.
  - **A feature**: something to add to the project in the current directory. Read its manifest (`package.json`, `Cargo.toml`, `pyproject.toml`, `go.mod`, `pubspec.yaml`, and so on) and README to learn the stack and platform. Read only. Change nothing.
- If the idea is too vague to search, because it names a whole category ("a notes app"), ask one question and wait. Otherwise ask nothing and start.
- Reply in the language the user wrote in.

## 2. Write the angles before you search

One phrasing finds one neighborhood, and the match that matters is often in another. Before the first search, write 6 to 10 phrasings that cover these angles:

- **Their words**: the user's own description.
- **The need**: what someone with the problem would type ("remember to drink water", not "hydration reminder app").
- **Today's workaround**: how people get this done now, software or not: a spreadsheet, a phone alarm, a group chat, a script. The workaround is a competitor.
- **The platform**: does the OS, browser, framework, standard library, or host app already ship this, or has it announced it?
- **The builder's words**: the terms an implementer would use (protocols, libraries, file formats).
- **Next door**: the neighboring field or community that likely solved it first.
- **This year**: the idea plus the current year, to catch recent launches.
- **The graveyard**: the idea plus "shut down", "archived", "abandoned", or "post-mortem".

## 3. Search where things live

Pick the venues that fit the idea:

- Apps and products: app stores (Google Play, App Store, F-Droid), browser extension stores, Product Hunt, AlternativeTo, template galleries.
- Open source: GitHub, GitLab, awesome lists (awesome-selfhosted too), package registries.
- Features: the stack's package registry, the framework's docs and plugin directory, and how well-known projects on the same stack built the same feature.
- Discussion: Hacker News (Show HN), Reddit, the domain's own forums.
- The platform itself: its docs, changelog, and roadmap.

Then:

- **Read the source.** Open the real page of every strong candidate (repo, homepage, store listing, docs). Note what it does, when it last shipped, and what it costs. Search snippets overclaim.
- **Go one layer down.** If a match is built on, wraps, or extends another project, that one may be the real incumbent. Search it too.
- **Empty is not novel.** If a search finds nothing, rephrase before you call the idea open. Most "new" ideas exist under another name.

## 4. Budget

- Default: about 6 searches and 3 page reads.
- `deep`: about 12 searches and 8 page reads.
- Always at least 4 searches from different angles. Stop early once the answer is clear. Never claim coverage you did not do.

## 5. Report

Fit it on one screen, in this shape:

```markdown
## itexists: <the idea in 8 words or less>

**Verdict: <VERDICT>, <name, if any>.** <one sentence why>

<the idea restated in one line>

| What | Type | Status | Price | Covers | Missing |
|---|---|---|---|---|---|
<up to 6 rows, strongest first, each name linked to the page you read>

- **Job:** what it does for whom, and today's workaround
- **Closest:** the strongest match, and what it is built on
- **Platform:** whether the platform ships it or has announced it
- **Graveyard:** who tried and stopped, and why
- **Gap:** the smallest piece nothing covers, or "none found"

**Next step:** <one concrete action, offered as a question>
```

- Type: app, open source, SaaS, library, extension, built-in, template, or workaround.
- Status: active, quiet, or dead, with the last release or commit date you saw.
- If the platform ships it or has announced it, say so in bold. A built-in feature usually wins on reach, even when it is worse.
- If the verdict is not BUILD IT, add one last line: "Building it to learn? Build it, and study <best project> first."

## 6. Verdict

Pick exactly one:

| Verdict | When |
|---|---|
| **USE IT** | Something maintained does most of what the user asked for. Name it. |
| **EXTEND IT** | Something covers most of it and takes plugins, config, forks, or pull requests. Name it and the extension point. |
| **BUILD THE GAP** | Existing tools cover the core, but one slice is missing. Build only that slice, on top of them where possible. |
| **BUILD IT** | After a real search, nothing close exists, or what exists is dead or locked to a platform the user does not use. Say where you looked. |
| **DIG FIRST** | Someone built this and stopped. Read why (closed issues, a shutdown post, reviews) before building. |

Reasons that justify building anyway: open source where the rest is closed, cross-platform where the rest is not, local or private where the rest is cloud-only, free where cost blocks people, a group of users nobody serves, or a hard constraint (license, stack, compliance). Reasons that do not: "mine will look better", "mine will have more features", "theirs is not that good". Turn the last one into a concrete gap or drop it.

## 7. Hand off

The next step offers a hand-off. Do it only after the user says yes:

- **USE IT**: get it running. The install command, the store link, or the setup steps for their platform. For a library, the exact add command for the project's package manager.
- **EXTEND IT**: the repo, the extension point (plugin API, config, an open issue), and the smallest first change.
- **BUILD THE GAP** or **BUILD IT**: the scope in one paragraph, and what to reuse.
- **DIG FIRST**: the links to read, in order.

Never install, sign up, run commands that change anything, or post issues or pull requests until the user says yes.

## Never

- Invent projects, stars, prices, or dates. State only what you read. If nothing is close, say "nothing close found" and list where you looked.
- Hedge the verdict with "it depends". Pick one. The user can push back.
- Soften USE IT to be kind. Finding what already exists is the skill working.
- Stop at the first match. It is the baseline, not the answer.
- Recommend a dead project without saying it is dead.
