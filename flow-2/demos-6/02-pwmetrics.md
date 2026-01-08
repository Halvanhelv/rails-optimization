https://github.com/paulirish/pwmetrics

CLI tool and lib to gather performance metrics via Lighthouse

```
yarn global add pwmetrics
pwmetrics http://example.com/ --runs=3
pwmetrics http://example.com/ --json
pwmetrics http://example.com/ --output-path='pathToFile/file.json'
```

There is an option to set **expectations** to verify their fulfillment
