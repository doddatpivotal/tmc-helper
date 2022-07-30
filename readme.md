# TMC Helper

This repo can be used to assist in managing TMC resources.  Helpful to bootstrapping a fresh TMC org.

## Usage

Copy `local-config/params-REDACTED.yaml` and name it something else.  Update to your specifications and then set the environment variables to the path.

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

TMC Advanced offers the ability to quota policies.  The following set of quota policies aligns with common Tanzu usage.

- Compute
- External Services
- Storage

You can apply quota policies by executing the following.  It will upsert the policies maintained in the `policy/quota` directory.

```bash
./scripts/upsert-quota-policies.sh
```

## Image Registry Policies

TMC Advanced offers the ability to image registry policies.  The following set of image registry policies aligns with common Tanzu usage.

- Block Latest
- Limit to private registry

You can apply image registry policies by executing the following.  It will upsert the policies maintained in the `policy/image-registry` directory.

```bash
./scripts/upsert-image-registry-policies.sh
```
