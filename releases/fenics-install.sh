#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 legacy (dolfin)..."

# Step 1: Add FEniCS PPA
apt-get update -qq
apt-get install -y software-properties-common
add-apt-repository -y ppa:fenics-packages/fenics
apt-get update

# Step 2: Install FEniCS legacy stack
apt-get install -y \
    fenics \
    python3-dolfin \
    python3-dijitso \
    python3-ffc \
    python3-fiat

# Step 3: Fix ufl conflict from pip install
/usr/bin/python3 -m pip uninstall -y fenics-ufl || true

# Step 4: Create symbolic link to fix FIAT capitalization issue
cd /usr/lib/python3/dist-packages
[ ! -d FIAT ] && ln -s fiat FIAT
[ ! -d dijitso ] && ln -s dijitso dijitso  # should already exist
[ ! -d ffc ] && ln -s ffc ffc             # should already exist

echo "✅ FEniCS + dolfin legacy installed."
