#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

PACKAGES=(kitty nvim tmux)

echo "📂 Dotfiles directory: $(pwd)"
echo "🔗 Packages: ${PACKAGES[*]}"
echo

if ! command -v stow >/dev/null 2>&1; then
  echo "❌ GNU Stow not found. Install with: brew install stow"
  exit 1
fi

echo "🔍 Running stow dry-run..."
for pkg in "${PACKAGES[@]}"; do
  echo "→ stow -n $pkg"
  stow -n "$pkg"
done

echo
read -p "Proceed with stowing? (y/n): " confirm
[[ "$confirm" == "y" ]] || exit 0

echo
echo "🚀 Applying dotfiles..."
stow -R "${PACKAGES[@]}"

echo "✅ Dotfiles setup complete!"

