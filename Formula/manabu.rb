class Manabu < Formula
  desc "Japanese sentence-level reading CLI backed by the DeepSeek API"
  homepage "https://github.com/Makuraryu/manabu"
  url "https://github.com/Makuraryu/manabu/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "cebeec60095e8e523fab714b5f65a51778fcec8b499cb652e9ef425453be67cd"
  license "MIT"

  depends_on "nim"

  def install
    # nimble downloads illwill and parsetoml at build time
    system "nimble", "build", "-d:release", "--accept"
    bin.install "manabu"
  end

  def caveats
    <<~EOS
      Before first use, create your config file:
        mkdir -p ~/.config/manabu
        echo 'api_key = "sk-your-deepseek-key"' > ~/.config/manabu/config.toml

      Get a DeepSeek API key at: https://platform.deepseek.com
    EOS
  end

  test do
    # Running without arguments should print usage and exit 1
    assert_match "manabu", shell_output("#{bin}/manabu 2>&1", 1)
  end
end
