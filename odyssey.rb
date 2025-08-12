class Odyssey < Formula
  desc "Secure command-line cryptocurrency wallet supporting Ethereum, Bitcoin, and Solana"
  homepage "https://github.com/chinmay1088/odyssey"
  url "https://github.com/chinmay1088/odyssey/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "e6632dfb16398ca5836309f1e01726fab0925eab6cdb931e75fe90d1837b4592"
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
