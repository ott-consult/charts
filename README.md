# charts

Various Helm charts used by me and my customers:

* **sealed-secrets-monitor** is a job that waits for [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets) to unseal. It can be used in conjunction with [Argo CD](https://argo-cd.readthedocs.io/en/stable/) to wait not only for the sealed secrets to be snychronized but also to be unsealed.
