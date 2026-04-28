require "language/node"

class Mmr < Formula
  desc "Multi-model code review CLI — async dispatch, reconciliation, and severity gating"
  homepage "https://github.com/zigrivers/scaffold/tree/main/packages/mmr"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/mmr-v1.3.0.tar.gz"
  sha256 "c01b474076f6f2a47a6d59415756d6e5e7d72a6a6a5121ed16d34ba244c38f7c"
  license "MIT"
  version "1.3.0"

  depends_on "node"

  def install
    system "npm", "install"
    cd "packages/mmr" do
      system "npm", "run", "build"
      system "npm", "install", *Language::Node.std_npm_install_args(libexec)
      bin.install_symlink Dir["#{libexec}/bin/*"]
    end
  end

  test do
    assert_match "mmr", shell_output("#{bin}/mmr --help")
  end
end
