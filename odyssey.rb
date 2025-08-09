class Odyssey < Formula
  desc "Secure command-line cryptocurrency wallet supporting Ethereum, Bitcoin, and Solana"
  homepage "https://github.com/chinmay1088/odyssey"
  url "https://github.com/chinmay1088/odyssey/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "230ec793a2808777e4a9ba4981bc3449dd584d967dc426fe0956edaaaf3bc778"
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
