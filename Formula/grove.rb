# Homebrew formula for grove. Lives in the tap repo Entelligentsia/homebrew-grove
# (as Formula/grove.rb), letting users run:
#
#   brew install Entelligentsia/grove/grove
#
# The sha256 values below are per-release. Regenerate this file after tagging
# with: dist/homebrew/update-formula.sh v0.1.0  (fills version + hashes from the
# release's .sha256 sidecar assets).
class Grove < Formula
  desc "Structural, byte-precise, token-cheap codebase access for coding agents"
  homepage "https://github.com/Entelligentsia/grove"
  version "0.1.1"
  license "MIT"

  BASE = "https://github.com/Entelligentsia/grove/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/grove-aarch64-apple-darwin.tar.gz"
      sha256 "cc62cf2ae332dc23aa5f9816ac69ea731a940ae1e97341765dba99dc48a3ce00"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-apple-darwin.tar.gz"
      sha256 "6d0b6a97ed47e56af2f76f45356727bfbb14dfc5fce51e518253e75f71eefa8b"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/grove-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8549865a486e70941d6a9c4b512849bce0d1635a5ce51f60c8cdc1cfecb1cf1f"
    end
    on_intel do
      url "#{BASE}/grove-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8ff08ab6a5f9670afb34b844b67ac0138520d954a40967f79164013046982d6"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match "grove", shell_output("#{bin}/grove --version")
  end
end
