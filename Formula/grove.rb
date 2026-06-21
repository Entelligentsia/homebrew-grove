# Homebrew formula for grove. Lives in the tap repo Entelligentsia/homebrew-grove
# (as Formula/grove.rb), letting users run:
#
#   brew install Entelligentsia/grove/grove
#
# The sha256 values below are per-release placeholders. Regenerate this file
# after tagging with:
#   dist/homebrew/update-formula.sh <vX.Y.Z> > grove.rb
# which fills the version + hashes from the release's .sha256 sidecar assets,
# then copy it into the tap repo as Formula/grove.rb.
class Grove < Formula
  desc "Structural, byte-precise, token-cheap codebase access for coding agents"
  homepage "https://github.com/Entelligentsia/grove"
  version "0.1.2"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "c47eb8831fd255fe7a4fd72d6005d7c420a1ffd9bd7b3754bd7b28a28fee83a6"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "f0871b859e10113deb4985ddec4474d640743c10a5818408a3e66391ccfc916e"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc19224f3889a7fe069572ced0b97316cb5451bc221d1d16c618eca9229f1fb7"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcd98fcffd07099e8d7598b305ba00471cf462d4bc15ba8625a5085908a6aaef"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
  end
end
