#!/bin/sh

CMD=${1:-install}
PREFIX=${2:-$HOME/local/bin}

install() {
    echo "Attempting to install minikube and assorted tools to $PREFIX"

    # check if Docker is installed
    if ! command docker >/dev/null 2>&1; then
        echo "Installing docker"
        brew install --cask docker
    else
        echo "Docker is already installed - $(docker -v)"
    fi

    # check if kubectl is installed
    if ! command kubectl >/dev/null 2>&1; then
        echo "Installing kubectl"
        brew install kubectl
    else
        echo "kubectl is already installed - $(kubectl version)"
    fi

    # check if kubectl is installed
    if ! command minikube >/dev/null 2>&1; then
        echo "Installing minikube"
        brew install minikube
    else
        echo "minikube is already installed - $(minikube version)"
    fi

    # check if docker is running
    if ! docker info >/dev/null 2>&1; then
        echo "Docker isn't running, starting up Docker"
        open -a Docker

        while ! docker info; do
            echo "$(date) - still waiting for Docker up and run"
            sleep 1
        done
    else
        echo "Docker is up and run"
    fi

    # check if k8s is running
    if minikube status | grep -q 'host: Stopped\|minikube start'; then
        echo "minikube isn't running, starting up minikube using the docker driver"
        minikube start --driver=docker
    else
        echo "minikube is up and run"
    fi

}

remove() {
    echo "Removing minikube and assorted tools"

    brew uninstall minikube
    brew uninstall kubectl
    brew uninstall --cask docker
}

case $CMD in
install)
    install
    ;;
remove)
    remove
    ;;
*)
    echo "install_minikube.sh [install|remove] <install_prefix>"
    ;;
esac
