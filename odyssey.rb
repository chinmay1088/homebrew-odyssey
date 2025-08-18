class Odyssey < Formula
  desc "Secure command-line cryptocurrency wallet supporting Ethereum, Bitcoin, and Solana"
  homepage "https://github.com/chinmay1088/odyssey"
  url "https://github.com/chinmay1088/odyssey/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "9c84ff6f95cad9e40992d541cbd6557a2278c4475372234ee7b73a5cb448fb4c"
  license "MIT"
  head "https://github.com/chinmay1088/odyssey.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install_symlink "odyssey" => "ody"
  end

  def post_install
    (var/"odyssey").mkpath
  end

  def caveats
    <<~EOS
      Odyssey stores wallet and configuration files in:
        #{ENV["HOME"]}/.odyssey/

      To get started:
        odyssey init    # Initialize a new wallet
        odyssey unlock  # Unlock your wallet
        odyssey address # View your addresses

      You can also use 'ody' as a shorter alias for all commands
    EOS
  end
end
