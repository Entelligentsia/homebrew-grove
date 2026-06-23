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
  version "0.1.7"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "1de1dc4eb562ba748db0bb5c9f8ee6c658e5008fa2d220b33a055a515dfb4368"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "4fc4af3404cee4ce76bc3420cb2ecbc56520f1f8915994ee7010dbf00d4d6fbe"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "306ce027c219e25f831095154654c291e4b4fc24a48c8c4664e3413b73d4bf07"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26b7776e89eb39fcc73c53ca2aa2ddf9efd23fd8205dcd0b20cbd4105b091629"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
  end
end
