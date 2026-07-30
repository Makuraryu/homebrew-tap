# frozen_string_literal: true

# Homebrew formula for Noren.
class Noren < Formula
  desc "Scrolling terminal multiplexer built around horizontal workspaces"
  homepage "https://github.com/Makuraryu/Noren"
  url "https://github.com/Makuraryu/Noren/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "3c0941dea524d61a1e384af0545f68b15b96f656f515ef11c0139a45c315d9c2"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "noren 0.4.2", shell_output("#{bin}/noren version")
  end
end
