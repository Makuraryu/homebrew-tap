# frozen_string_literal: true

# Homebrew formula for Noren.
class Noren < Formula
  desc "Scrolling terminal multiplexer built around horizontal workspaces"
  homepage "https://github.com/Makuraryu/Noren"
  url "https://github.com/Makuraryu/Noren/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "03c4c65f4262d4f80f1014d1a072f9c29d05fc55d7b8f17c5351de2f5dd05a25"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "noren 0.4.4", shell_output("#{bin}/noren version")
  end
end
