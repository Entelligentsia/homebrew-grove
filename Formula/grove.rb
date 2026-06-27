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
  version "0.1.11"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "4f66fc36045919362756937afeeb819ba2a7807eb5ff966cb0fc0f1fcc34b632"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "e712757af8f451cd9946c720d6df1db0a5bff19ea8b7687d9c26fbedb36071f4"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "184a3259e55c9e7ab658af77cd4a9618891530dd944c08a26af4d9fafd42e717"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf3b4779af9d289c786386afb700f87b5265f5523781564cfd2cec6e32657123"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
  end
end
