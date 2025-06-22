#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 and dolfin..."

apt-get update -qq
apt-get install -y software-properties-common
add-apt-repository -y ppa:fenics-packages/fenics
apt-get update

# Core FEniCS installation
apt-get install -y fenics python3-dolfin

# 🔧 Fix missing dependencies and pip conflicts
apt-get install -y python3-dijitso python3-ffc python3-fiat
pip uninstall -y fenics-ufl || true

# Confirm installation
python3 -c "import dolfin; print('✅ dolfin module is available in Python.')"

echo "✅ FEniCS and dolfin installation complete"
