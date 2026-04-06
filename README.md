# k8s-homelab
A terrible idea

--SHAs for worker and control plane nodes
AMD GPU, AMD ucode - 9c1d1b442d73f96dcd04e81463eb20000ab014062d22e1b083e1773336bc1dd5
ARM64 - 376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba
Intel GPU, Intel uCode - 4b3cd373a192c8469e859b7a0cfbed3ecc3577c4a2d346a37b0aeff9cd17cdb0

Upgrading to latest
-- talosctl -n <node IP or DNS name> upgrade --image=factory.talos.dev/installer/ee21ef4a5ef808a9b7484cc0dda0f25075021691c8c09a276591eedb638ea1f9:v1.9.5

Current state:
Controller is bootstrapped. Worker is not.
- /temp/ folder has machine config and talosconfig files (STOP PREDICTING EVERYTHING)
- Need to place that here and use create_defined_machineconfigs to create the machine configs for intel (for now)
- Finish bootstrapping worker. Get argoCD installed. -> install one thing (?) -> README.
- Finish updating secrets helper files.
