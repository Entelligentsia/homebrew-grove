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
  version "0.2.0"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "2b8667b9204b92adb2c9410388bcc2efaed76d9c972545cb661dc79a0c743bf4"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "adda1253645c64f2245e182ef1828991b36241257833b9aa0d9173473643a0b7"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec8141e7999531380947a8755cf1850cecf424dbcd1008ff2504a153029be7cf"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b06fa098c89f1bf7ad1aa49e0e7f0b97e0a1d9b0062cb240dad89c0f156169d"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
  end
end
