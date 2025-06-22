#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 and dolfin..."

# Update and install software-properties-common
apt-get update -qq
apt-get install -y software-properties-common

# Add the FEniCS PPA and update
add-apt-repository -y ppa:fenics-packages/fenics
apt-get update

# Install FEniCS core (includes dolfin and all dependencies)
apt-get install -y fenics

# Make sure python3-dolfin is present (redundancy is OK here)
apt-get install -y python3-dolfin

# Confirm dolfin is available in Python
python3 -c "import dolfin; print('✅ dolfin module is available in Python.')"

echo "✅ FEniCS and dolfin installation complete"

