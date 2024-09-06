# AdGuard Exporter

Allows you to configure prometheus metrics exporting using [adguard-exporter](https://github.com/henrywhitaker3/adguard-exporter).

This is bare bones for a reason, it doesnt need to be anything more than what it is for most use-cases.

## Configuration
For it to (in the immortal words of Todd Howard) "just work", your AdGuard instance should:
1. be located at `http://192.168.1.2`
2. have a user called `adguard`
3. have created a secret in the deployment namespace called either:
    1. `adguard-secret` with the key `password`
    1. `adguard-secrets` with at least the key `ADGUARD_PASSWORDS`

> Note: this is configured for a single instance usage with the assumptions made above.

You can override things in the chart if your requirements are outside these opinionated defaults.

## Accessing

Once created the metrics are available at the service endpoint `http://agduard-exporter.<namespace>.svc/metrics`

## Ingress

If your Prometheus is located external to your cluster, be sure to configure the `Ingress` resource
At a mimium this entails setting the following (but likely you'll need to set more for your setup):
```yaml
ingress:
  enabled: true
```

## Thanks
This is just a helm chart abstraction of the awesome work done by [henrywhitaker3](https://github.com/henrywhitaker3) in https://github.com/henrywhitaker3/adguard-exporter

I extend my gratious thanks.