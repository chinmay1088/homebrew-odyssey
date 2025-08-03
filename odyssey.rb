class Odyssey < Formula
  desc "Secure command-line cryptocurrency wallet supporting Ethereum, Bitcoin, and Solana"
  homepage "https://github.com/chinmay1088/odyssey"
  url "https://github.com/chinmay1088/odyssey/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "5aef4da78c5ae87aa2468995108356f0e2f20247ddc90f63fed6bf769228dc76"
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
