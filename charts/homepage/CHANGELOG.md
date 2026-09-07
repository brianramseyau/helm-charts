# Changelog

## 0.0.7
- fix: template env values and add Service name to HOMEPAGE_ALLOWED_HOSTS so in-cluster access (incl. the helm test) passes host validation

## 0.0.6
- fix: inject pod IP into HOMEPAGE_ALLOWED_HOSTS so liveness/readiness probes pass host validation on v2.x

## 0.0.5
- chore: update homepage version to v2.2.0

## 0.0.4
- chore: update homepage version to v1.11.0

## 0.0.3
- feat: adds helm docs

## 0.0.2
- fix: traefik annotations incorrectly on ingress instead of service

## 0.0.1
- Initial commit
