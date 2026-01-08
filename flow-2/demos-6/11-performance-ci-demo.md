https://github.com/spajic/performance-ci-demo/

Build status in travis - passing: https://travis-ci.com/spajic/performance-ci-demo

In `budget.json` the budget for total request count is defined

```json
{
  "budget": {
    "requests": {
      "total": 300
    }
  }
}
```

`travis.yml`
```yml
language: node_js
node_js:
  - "10"

sudo: required

services:
  - docker

script:
- docker run --privileged -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io --budget.configPath /sitespeed.io/budget.json -n 1 https://dev.to
# - yarn run size

after_success:
  - yarn run lh -- --perf=90 https://dev.to
```

Let's make a PR with reduced budget - we'll get a failed build

## github actions
https://github.com/spajic/performance-ci-demo/actions

.github/workflows/main.yml
```yml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: run sitespeedio test
      uses: docker://sitespeedio/sitespeed.io:9.8.1-action
      with:
        args: https://dev.to -n 1 --budget.configPath /github/workspace/.github/budget.json
```
