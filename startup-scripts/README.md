To run demo, follow these steps:

1. Install the latest version of [k3d](https://k3d.io/stable/).
1. Run `cd startup-scripts/`
1. Run `./start.sh`.
1. Run `mv env-vars.sh.demo env-vars.sh`.
1. Update `env-vars.sh` with your own values (GITOPS_REPO_URL should probably stay the same).
1. Run `./env-vars.sh`.
1. Run `envsubst < resources.yaml| kubectl apply -f -`
