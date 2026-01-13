CLUSTER_NAME=$(shell cat config.yaml | yq .cluster_name)
CONTROL_PLANE_ENDPOINT=$(shell cat config.yaml | yq .control_plane_endpoint)
# WORKER_NODES=$(shell cat config.yaml | yq .workers.nodes)
# CONTROLLER_NODES=$(shell cat config.yaml | yq .controllers.nodes)

generate_default_config_files:
	@echo creating default machineconfigs and talosconfig
	@talosctl gen config ${CLUSTER_NAME} "https://${CONTROL_PLANE_ENDPOINT}:6443"

create_defined_machineconfigs:
	@echo Installing pre-reqs
	@pip3 install -r requirements.txt
	@echo running parse config script
	@python3 generate_defined_machineconfigs.py --config-path config.yaml
	
bootstrap_controller:
	@echo "applying machine config and bootstrapping controllers"

bootstrap_nodes:
	@echo "bootstrapping nodes"

bootstrap_cluster:
	@echo "bootstrapping first controller node with talos bootstrap"

update_nodes:
	@echo "Updating nodes"

update_controllers:
	@echo "Updating controllers"