# Contributing

The whole project is one file, [`skills/itexists/SKILL.md`](skills/itexists/SKILL.md). Most changes are to how it searches, reads, or reports.

## Try a change

Load your copy as a Claude Code plugin and run it:

```bash
claude --plugin-dir .
```

Then, in that session:

```text
/itexists:itexists <an app or tool idea>
```

Run it on at least one whole app or tool, and on one feature from inside a real project. A change that helps one kind of idea can hurt another.

## Before you open a pull request

- Run `scripts/check.sh`. CI runs the same checks: the plugin and skill validate, and no markdown file has an em dash.
- Keep `SKILL.md` short. Every line is read on every run, so a new line has to change what the agent does.
- Paste one real run with your change into the pull request, and say which agent ran it.
- No numbers about time or tokens saved, anywhere. Show a real run instead.

## Report a bad result

If itexists missed something, invented something, or picked the wrong verdict, [open a bad report](https://github.com/y0sif/itexists/issues/new?template=bad-report.yml). The link it should have found is the most useful part.
