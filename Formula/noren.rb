# frozen_string_literal: true

# Homebrew formula for Noren.
class Noren < Formula
  desc "Scrolling terminal multiplexer built around horizontal workspaces"
  homepage "https://github.com/Makuraryu/Noren"
  url "https://github.com/Makuraryu/Noren/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "fe606d0c6d918f89d6ff71f6a77c656a1aa123254a7d49654406c18aaf300555"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "noren 0.4.3", shell_output("#{bin}/noren version")
  end
end
