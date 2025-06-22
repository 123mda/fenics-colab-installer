#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 via PPA..."

apt-get update -qq
apt-get install -y software-properties-common
add-apt-repository -y ppa:fenics-packages/fenics
apt-get update
apt-get install -y fenics

echo "✅ FEniCS installation complete"
