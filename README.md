# charts

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Static Badge](https://img.shields.io/badge/gpg-71C590A765F752B9FEFCC4DF9AE0A5E8B053F8AE-blue)](https://keys.openpgp.org/search?q=signing%40ott-consult.de)

This repository contains various Helm charts used by me and my customers:

* **sealed-secrets-monitor** is a job that waits for [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets) to unseal. It can be used in conjunction with [Argo CD](https://argo-cd.readthedocs.io/en/stable/) to wait not only for the sealed secrets to be snychronized but also to be unsealed.

## Getting started

[Helm](https://helm.sh) must be installed to use the charts in this repository.

Refer to Helm's [documentation](https://helm.sh/docs/) to get started.

## Installation

```console
helm repo add joernott https://joernott.github.io/charts/
helm repo update joernott
```

## Contributing

Contributions are welcome. To contribute code:

* Fork this repo,
* Make your changes
* Values files should be commented in [helm-docs](https://github.com/norwoodj/helm-docs) format.
* Install [pre-commit](https://pre-commit.com/) and the pre-commit hooks, the chart README and Values schema in JSON format will be auto generated with those hooks,
* Make sure the CI tests are passing,
* Submit a PR
