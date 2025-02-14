#!/bin/bash

# ����� ��� ������ � �������
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# �����������
declare -A messages

set_language() {
  case "$1" in
    "ru")
      messages=(
        ["folder_exists"]="����� .titanedge ��� ����������. ������� ���� � ���������� ������. �����..."
        ["port_busy"]="������: ���� %s �����. ��������� �� ������ �����������."
        ["ports_free"]="��� ����� ��������! ������ �������� ���������...\n"
        ["installing_deps"]="������� ��������� ������������..."
        ["docker_installed"]="Docker ��� ����������. ����������"
        ["docker_compose_installed"]="Docker-Compose ��� ����������. ����������"
        ["deps_installed"]="����������� ����������� ���� �����������."
        ["starting_node"]="������ ����..."
        ["enter_hash"]="������� ��� HASH:"
        ["hash_empty"]="HASH �� ����� ���� ������."
        ["node_started"]="���� ���� ��������."
        ["updating_sysctl"]="���������� ������������ sysctl..."
        ["sysctl_backup"]="������ ��������� ����� ��� sysctl.conf.bak..."
        ["sysctl_updated"]="��������� ���������."
        ["selinux_disabled"]="������� SELinux..."
        ["selinux_not_installed"]="SELinux �� ����������."
        ["viewing_logs"]="�������� �����..."
        ["restarting_node"]="������������ ����..."
        ["node_restarted"]="���� ���� �������������."
        ["stopping_node"]="��������� ����..."
        ["node_stopped"]="���� ���� �����������."
        ["deleting_node"]="�������� ����..."
        ["confirm_delete"]="���� �� �������, ��� ������ ������� ����, �������� ����� ������ (CTRL+C ����� �����): "
        ["node_deleted"]="���� ���� �������."
        ["exiting_script"]="����� �� �������."
        ["invalid_choice"]="�������� �����. ����������, �������� ���������� ����� � ����."
        ["menu"]="����:"
        ["install_node"]="���������� ����"
        ["launch_node"]="��������� ����"
        ["view_logs"]="��������� ����"
        ["restart_node"]="������������� ����"
        ["stop_node"]="���������� ����"
        ["delete_node"]="������� ����"
        ["exit_script"]="����� �� �������"
        ["checking_updates"]="�������� ���������� �������..."
        ["script_up_to_date"]="������ ��� ��������."
        ["script_updated"]="������ ������� ��������. ������������� ���."
        ["error_command_failed"]="������ ��� ���������� �������: %s"
        ["welcome"]="ϳ������� �� ����� ��� Ҫ��� �ժ��� @temkasxema"
      )
      ;;
    "ua")
      messages=(
        ["folder_exists"]="����� .titanedge ��� ����. ������� ���� �� ��������� �����. �����..."
        ["port_busy"]="�������: ���� %s ��������. �������� �� ����� ����������."
        ["ports_free"]="�� ����� ����! ����� ��������� ������������...\n"
        ["installing_deps"]="������� ������������ �����������..."
        ["docker_installed"]="Docker ��� �����������. ����������"
        ["docker_compose_installed"]="Docker-Compose ��� �����������. ����������"
        ["deps_installed"]="�������� ��������� ���� ����������."
        ["starting_node"]="������ ����..."
        ["enter_hash"]="������ ��� HASH:"
        ["hash_empty"]="HASH �� ���� ���� �������."
        ["node_started"]="���� ���� ��������."
        ["updating_sysctl"]="��������� ������������ sysctl..."
        ["sysctl_backup"]="������ �������� ���� ��� sysctl.conf.bak..."
        ["sysctl_updated"]="������������ �������."
        ["selinux_disabled"]="�������� SELinux..."
        ["selinux_not_installed"]="SELinux �� �����������."
        ["viewing_logs"]="�������� ����..."
        ["restarting_node"]="���������������� ����..."
        ["node_restarted"]="���� ���� ���������������."
        ["stopping_node"]="������� ����..."
        ["node_stopped"]="���� ���� ��������."
        ["deleting_node"]="��������� ����..."
        ["confirm_delete"]="���� �� �������, �� ������ �������� ����, �������� ����-���� ������ (CTRL+C ��� �����): "
        ["node_deleted"]="���� ���� ��������."
        ["exiting_script"]="����� � �������."
        ["invalid_choice"]="������� �����. ���� �����, ������� ��������� ����� � ����."
        ["menu"]="����:"
        ["install_node"]="���������� ����"
        ["launch_node"]="��������� ����"
        ["view_logs"]="����������� ����"
        ["restart_node"]="��������������� ����"
        ["stop_node"]="�������� ����"
        ["delete_node"]="�������� ����"
        ["exit_script"]="����� � �������"
        ["checking_updates"]="�������� �������� �������..."
        ["script_up_to_date"]="������ ��� ���������."
        ["script_updated"]="������ ������ ��������. ������������ ����."
        ["error_command_failed"]="������� ��� �������� �������: %s"
        ["welcome"]="ϳ������� �� ����� ��� Ҫ��� �ժ��� @temkasxema"
      )
      ;;
    "en")
      messages=(
        ["folder_exists"]="Folder .titanedge already exists. Delete the node and install again. Exiting..."
        ["port_busy"]="Error: Port %s is busy. The program cannot proceed."
        ["ports_free"]="All ports are free! Installation will now begin...\n"
        ["installing_deps"]="Starting dependency installation..."
        ["docker_installed"]="Docker is already installed. Skipping"
        ["docker_compose_installed"]="Docker-Compose is already installed. Skipping"
        ["deps_installed"]="Required dependencies have been installed."
        ["starting_node"]="Starting the node..."
        ["enter_hash"]="Enter your HASH:"
        ["hash_empty"]="HASH cannot be empty."
        ["node_started"]="The node has been started."
        ["updating_sysctl"]="Updating sysctl configuration..."
        ["sysctl_backup"]="Creating a backup for sysctl.conf.bak..."
        ["sysctl_updated"]="Settings have been updated."
        ["selinux_disabled"]="Disabling SELinux..."
        ["selinux_not_installed"]="SELinux is not installed."
        ["viewing_logs"]="Viewing logs..."
        ["restarting_node"]="Restarting the node..."
        ["node_restarted"]="The node has been restarted."
        ["stopping_node"]="Stopping the node..."
        ["node_stopped"]="The node has been stopped."
        ["deleting_node"]="Deleting the node..."
        ["confirm_delete"]="If you are sure you want to delete the node, type any character (CTRL+C to exit): "
        ["node_deleted"]="The node has been deleted."
        ["exiting_script"]="Exiting the script."
        ["invalid_choice"]="Invalid choice. Please select the correct option from the menu."
        ["menu"]="Menu:"
        ["install_node"]="Install node"
        ["launch_node"]="Launch node"
        ["view_logs"]="View logs"
        ["restart_node"]="Restart node"
        ["stop_node"]="Stop node"
        ["delete_node"]="Delete node"
        ["exit_script"]="Exit script"
        ["checking_updates"]="Checking for script updates..."
        ["script_up_to_date"]="The script is already up to date."
        ["script_updated"]="The script has been updated. Please restart it."
        ["error_command_failed"]="Error executing command: %s"
        ["welcome"]="ϳ������� �� ����� ��� Ҫ��� �ժ��� @temkasxema"
      )
      ;;
    *)
      echo "Unsupported language. Defaulting to English."
      set_language "en"
      ;;
  esac
}

# ����� ����� ��� ������� �������
echo "Select language / ������� ���� / �������� ����:"
echo "1. English"
echo "2. �������"
echo "3. ���������"
read -p "Enter your choice (1/2/3): " lang_choice

case $lang_choice in
  1) set_language "en" ;;
  2) set_language "ru" ;;
  3) set_language "ua" ;;
  *) set_language "en" ;;
esac

# ������� ��� �������� ������� ����� .titanedge
check_titanedge_folder() {
  if [ -d "$HOME/.titanedge" ]; then
    echo -e "${RED}${messages["folder_exists"]}${NC}"
    return 1
  fi
  return 0
}

# ������� ��� �������� ��������� ������
check_ports() {
  local ports=("1234" "55702" "48710")
  for port in "${ports[@]}"; do
    if [[ $(lsof -i :"$port" | wc -l) -gt 0 ]]; then
      echo -e "${RED}$(printf "${messages["port_busy"]}" "$port")${NC}"
      return 1
    fi
  done
  echo -e "${GREEN}${messages["ports_free"]}${NC}"
  return 0
}

# ������� ��� ��������� ������������
install_dependencies() {
  echo -e "${YELLOW}${messages["installing_deps"]}${NC}"
  sudo apt update -y && sudo apt upgrade -y
  sudo apt-get install -y nano git gnupg lsb-release apt-transport-https jq screen ca-certificates curl

  if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Installing Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
  else
    echo -e "${GREEN}${messages["docker_installed"]}${NC}"
  fi

  if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Installing Docker-Compose...${NC}"
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  else
    echo -e "${GREEN}${messages["docker_compose_installed"]}${NC}"
  fi

  echo -e "${GREEN}${messages["deps_installed"]}${NC}"
}

# ������� ��� ������� ����
launch_node() {
  echo -e "${YELLOW}${messages["starting_node"]}${NC}"
  docker ps -a --filter "ancestor=nezha123/titan-edge" --format "{{.ID}}" | while read container_id; do
    docker stop "$container_id"
    docker rm "$container_id"
  done

  while true; do
    echo -en "${YELLOW}${messages["enter_hash"]}${NC} "
    read HASH
    if [ ! -z "$HASH" ]; then
        break
    fi
    echo -e "${RED}${messages["hash_empty"]}${NC}"
  done

  docker run --network=host -d -v ~/.titanedge:$HOME/.titanedge nezha123/titan-edge
  sleep 10

  docker run --rm -it -v ~/.titanedge:$HOME/.titanedge nezha123/titan-edge bind --hash=$HASH https://api-test1.container1.titannet.io/api/v2/device/binding
  
  echo -e "${GREEN}${messages["node_started"]}${NC}"
}

# ������� ��� ���������� ������������ sysctl
update_sysctl_config() {
  local CONFIG_VALUES="
net.core.rmem_max=26214400
net.core.rmem_default=26214400
net.core.wmem_max=26214400
net.core.wmem_default=26214400
"
  local SYSCTL_CONF="/etc/sysctl.conf"

  echo -e "${YELLOW}${messages["sysctl_backup"]}${NC}"
  sudo cp "$SYSCTL_CONF" "$SYSCTL_CONF.bak"

  echo -e "${YELLOW}${messages["updating_sysctl"]}${NC}"
  echo "$CONFIG_VALUES" | sudo tee -a "$SYSCTL_CONF" > /dev/null

  echo -e "${YELLOW}Applying new settings...${NC}"
  sudo sysctl -p

  echo -e "${GREEN}${messages["sysctl_updated"]}${NC}"

  if command -v setenforce &> /dev/null; then
    echo -e "${YELLOW}${messages["selinux_disabled"]}${NC}"
    sudo setenforce 0
  else
    echo -e "${GREEN}${messages["selinux_not_installed"]}${NC}"
  fi
}

# ������� ��� ��������� �����
docker_logs() {
  echo -e "${YELLOW}${messages["viewing_logs"]}${NC}"
  docker ps -a --filter "ancestor=nezha123/titan-edge" --format "{{.ID}}" | while read container_id; do
    docker logs "$container_id"
  done
}

# ������� ��� ������������ ����
restart_node() {
  echo -e "${YELLOW}${messages["restarting_node"]}${NC}"
  docker ps -a --filter "ancestor=nezha123/titan-edge" --format "{{.ID}}" | while read container_id; do
    docker restart "$container_id"
  done
  echo -e "${GREEN}${messages["node_restarted"]}${NC}"
}

# ������� ��� ��������� ����
stop_node() {
  echo -e "${YELLOW}${messages["stopping_node"]}${NC}"
  docker ps -a --filter "ancestor=nezha123/titan-edge" --format "{{.ID}}" | while read container_id; do
    docker stop "$container_id"
  done
  echo -e "${GREEN}${messages["node_stopped"]}${NC}"
}

# ������� ��� �������� ����
delete_node() {
  echo -e "${YELLOW}${messages["deleting_node"]}${NC}"
  read -p "${messages["confirm_delete"]} " checkjust

  docker ps -a --filter "ancestor=nezha123/titan-edge" --format "{{.ID}}" | while read container_id; do
    docker stop "$container_id"
    docker rm "$container_id"
  done

  sudo rm -rf $HOME/.titanedge

  echo -e "${GREEN}${messages["node_deleted"]}${NC}"
}

# �����������
LOG_FILE="$HOME/titan_node_install.log"
exec > >(tee -a "$LOG_FILE") 2>&1
echo -e "\n\n[$(date)] ������ �������." >> "$LOG_FILE"

# �����������
echo -e "${GREEN}${messages["welcome"]}${NC}"

# ������� ��� ���������� ������ � ���������� ������
run_command() {
  local cmd="$@"
  echo -e "${YELLOW}����������� �������: $cmd${NC}"
  if ! $cmd; then
    echo -e "${RED}$(printf "${messages["error_command_failed"]}" "$cmd")${NC}"
    exit 1
  fi
}

# ������� ��� �������� ��������� ������ � ������� ss
check_ports() {
  local ports=("1234" "55702" "48710")
  for port in "${ports[@]}"; do
    if ss -tuln | grep -q ":$port "; then
      echo -e "${RED}$(printf "${messages["port_busy"]}" "$port")${NC}"
      exit 1
    fi
  done
  echo -e "${GREEN}${messages["ports_free"]}${NC}"
}

# ������� ��� ���������� �������
update_script() {
  echo -e "${YELLOW}${messages["checking_updates"]}${NC}"
  curl -s https://raw.githubusercontent.com/your_repo/your_script.sh -o /tmp/titan_node_install.sh
  if diff /tmp/titan_node_install.sh "$0" &> /dev/null; then
    echo -e "${GREEN}${messages["script_up_to_date"]}${NC}"
  else
    mv /tmp/titan_node_install.sh "$0"
    chmod +x "$0"
    echo -e "${GREEN}${messages["script_updated"]}${NC}"
    exit 0
  fi
}

# ������� ��� ������ �� �������
exit_from_script() {
  echo -e "${GREEN}${messages["exiting_script"]}${NC}"
  exit 0
}

# �������� ����
show_menu() {
  while true; do
    echo -e "\n\n${messages["menu"]}"
    echo "1. ${messages["install_node"]}"
    echo "2. ${messages["launch_node"]}"
    echo "3. ${messages["view_logs"]}"
    echo "4. ${messages["restart_node"]}"
    echo "5. ${messages["stop_node"]}"
    echo "6. ${messages["delete_node"]}"
    echo "7. ${messages["exit_script"]}"
    echo "8. �������� ������"
    read -p "�������� ����� ����: " choice

    case $choice in
      1)
        if check_titanedge_folder && check_ports; then
          install_dependencies
        fi
        ;;
      2)
        launch_node
        ;;
      3)
        docker_logs
        ;;
      4)
        restart_node
        ;;
      5)
        stop_node
        ;;
      6)
        delete_node
        ;;
      7)
        exit_from_script
        ;;
      8)
        update_script
        ;;
      *)
        echo -e "${RED}${messages["invalid_choice"]}${NC}"
        ;;
    esac
  done
}

# ������ ����
show_menu