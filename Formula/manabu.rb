class Manabu < Formula
  desc "Japanese sentence-level reading CLI backed by the DeepSeek API"
  homepage "https://github.com/Makuraryu/manabu"
  url "https://github.com/Makuraryu/manabu/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "8c302039b5f36154f9c343b922c70af3a09a2f7175aef6282ab8585f64587450"
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
