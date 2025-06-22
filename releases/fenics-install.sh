#!/bin/bash
set -e

echo "📦 Installing FEniCS 2019.1.0 and dolfin (legacy)..."

# 1️⃣ Clean up any pip-installed ufl that might conflict
echo "🧹 Removing pip-installed ufl / fenics-ufl if present..."
pip uninstall -y fenics-ufl ufl || true

# 2️⃣ Update, install essentials, FEniCS via apt
apt-get update -qq
apt-get install -y --no-install-recommends \
  software-properties-common \
  python3-pip \
  python3-setuptools \
  python3-wheel \
  python3-dolfin \
  python3-dijitso \
  python3-ffc \
  python3-fiat \
  fenics

# 3️⃣ Clean pip cache to avoid residual conflicts
echo "🧹 Clearing pip cache..."
pip cache purge || true

# 4️⃣ Final version check
echo "✅ Installation complete. Versions:"
python3 - <<EOF
import dolfin, ufl
print("dolfin:", dolfin.__version__)
print("ufl   :", ufl.__version__)
EOF
