#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 and dolfin (legacy)..."

# Add the PPA and update
apt-get update -qq
apt-get install -y software-properties-common
add-apt-repository -y ppa:fenics-packages/fenics
apt-get update

# Install all FEniCS legacy packages and core dependencies
apt-get install -y \
    fenics \
    python3-dolfin \
    python3-dijitso \
    python3-ffc \
    python3-fiat

# Remove conflicting pip-installed ufl
pip uninstall -y fenics-ufl || true

# ✅ Optional: Confirm critical files exist
ls -l /usr/lib/python3/dist-packages/dijitso/__init__.py
ls -l /usr/lib/python3/dist-packages/ffc/__init__.py
ls -l /usr/lib/python3/dist-packages/FIAT/__init__.py

# ✅ Optional: Export workaround (last resort)
# export DOLFIN_ALLOW_USER_SITE_IMPORTS=1

echo "✅ FEniCS + dolfin legacy installed and cleaned."
