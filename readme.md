# TMC Helper

This repo can be used to assist in managing TMC resources.  Helpful to bootstrapping a fresh TMC org.

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
