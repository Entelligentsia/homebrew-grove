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
  version "0.5.0"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "53c86ab26f0d0867ae27cb68947daa3f90bc7ae7fe290a2131a6807f84f7e800"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "49e76287cff04a645278002cd393740f94cc013718914af20db8eece385b226d"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a77092bbb831e402652a6d49581f0ab75b20b2e239f5ed126f72f46d8e835745"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "037e196280206aceb0b7dde9e7e2772423194973b56b75970e32268352b731d7"
    end
  end

  def install
    bin.install "grove"
    bin.install "grove-explore"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
    assert_match "grove-explore", shell_output("#{bin}/grove-explore --version")
  end
end
