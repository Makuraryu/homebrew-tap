class Manabu < Formula
  desc "Japanese sentence-level reading CLI backed by the DeepSeek API"
  homepage "https://github.com/Makuraryu/manabu"
  url "https://github.com/Makuraryu/manabu/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6c9e46b54c6670344a2225addec67953721f7b7ed8783ac07989427581efc587"
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
