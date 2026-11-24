# homebrew-tap

Homebrew tap

## Roxel

```sh
brew install --cask starzonmyarmz/tap/roxel   # the Roxel app (macOS)
brew install starzonmyarmz/tap/rox            # the rox command-line tool
```

## Hogs

```sh
brew install --cask starzonmyarmz/tap/hogs
```

## How the tap updates

The formulas and casks listed in [`projects`](projects) are generated. Edit
their templates in each project, not here.

The [Update](.github/workflows/update.yml) workflow runs `scripts/update` every
hour, and whenever you start it with
`gh workflow run update.yml -R starzonmyarmz/homebrew-tap`. For each line of
`projects`, the script:

1. finds the project's latest release,
2. reads the template from the project's default branch,
3. replaces `@VERSION@` with the release's version (the tag without its `v`),
4. replaces each `@SHA256:<file>@` with that file's checksum from the release's
   `SHA256SUMS` asset,
5. commits the file as `chore(<name>): update to X.Y.Z` if it changed.

`@VERSION@` is replaced first, so a versioned file name works:
`@SHA256:hogs-@VERSION@.zip@`.

The workflow uses its own `GITHUB_TOKEN`, so projects need no token to publish
here. A project's update fails, and leaves its file alone, when the release has
no `SHA256SUMS`, lacks a file the template names, or the template has a
placeholder the script doesn't know.

To add a project, add a line to `projects` and give the project's release a
`SHA256SUMS` asset.

GitHub turns off scheduled workflows after 60 days without activity in the
repository. `/pk-release` turns it back on and starts it after each release.
