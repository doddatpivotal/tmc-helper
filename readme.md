# TMC Helper

This repo can be used to assist in managing TMC resources.  Helpful to bootstrapping a fresh TMC org.

## Usage

Copy `local-config/params-REDACTED.yaml` and name it something else.  Update to your specifications and then set the environment variables to the path.  The scripts allow for some personalization to the label_namespace and to the name prefix.  This may be helpful in an org which is used by several others (like in a lab environment). You can enable personization in the params file.

```bash
cp local-config/params-REDACTED.yaml local-config/params.yaml
# edit local-config/params.yaml accordingly
export PARAMS_YAML=local-config/params.yaml
```

## Custom Roles

TMC Advanced offers the ability to create custom roles that can be bound to users and groups.  The following set of custom roles aligns with common Tanzu usage.

- vSphere with Tanzu
- Contour
- Build Service
- General Tanzu App

You can apply custom roles by executing the following.  It will upsert the custom roles maintained in the `custom-roles` directory.

```bash
./scripts/upsert-custom-roles.sh
```

## Quota Policies

TMC Advanced offers the ability to manage quota policies.  The following set of quota policies aligns with common Tanzu usage.

- Compute
- External Services
- Storage

You can apply quota policies by executing the following.  It will upsert the policies maintained in the `policy/namespace-quota` directory.

```bash
./scripts/upsert-org-policies.sh namespace-quota
```

## Image Registry Policies

TMC Advanced offers the ability to manage image registry policies.  The following set of image registry policies aligns with common Tanzu usage.

- Block Latest
- Limit to private registry

You can apply image registry policies by executing the following.  It will upsert the policies maintained in the `policy/image` directory.

```bash
./scripts/upsert-org-policies.sh image
```

## Security Policies

TMC Advanced offers the ability to manage security policies.  The following set of security policies aligns with common Tanzu usage.

- Baseline Security in Audit Mode for entire org

You can apply security policies by executing the following.  It will upsert the policies maintained in the `policy/security` directory.

```bash
./scripts/upsert-org-policies.sh security
```

## Custom Policies

TMC Advanced offers the ability to manage custom policies.  The following set of custom policies aligns with common Tanzu usage.

- Require pods to specify app-tier

You can apply custom policies by executing the following.  It will upsert the policies maintained in the `policy/custom` directory.

```bash
./scripts/upsert-org-policies.sh security
```

## Network Policies

TMC Advanced offers the ability to manage network policies.  The following set of network policies aligns with common Tanzu usage.

- Allow all ingres to web apps
- Allow ingress from web apps to db
- Deny all ingress

You can apply network policies by executing the following.  It will upsert the policies maintained in the `policy/network` directory.

```bash
./scripts/upsert-org-policies.sh network
```
