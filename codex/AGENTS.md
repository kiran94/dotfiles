# Developer Guidance

* Prefer documented `make` targets for linting, testing, building, and local workflows. If a `Makefile` exists.
* Branches should use convention e.g feat/<description>, fix/<description>
* Branches should not have codex in the name


# Restricted Operations

* Never commit to the repository.
* Never push to the repository.
* Never make external cloud, production, S3, or third-party service changes without explicit approval.
* Never scan the `data`, `.uv-cache`, `node_modules` or any vendor folder.
* Do not directly read the `.env*` file.
* Do not read secrets files, credentials, private keys, or local config containing tokens unless explicitly approved.
* Do not revert or overwrite user changes unless explicitly asked.
