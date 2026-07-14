require "language/node"

class Mmr < Formula
  desc "Multi-model code review CLI — async dispatch, reconciliation, and severity gating"
  homepage "https://github.com/zigrivers/scaffold/tree/main/packages/mmr"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/mmr-v3.1.2.tar.gz"
  sha256 "195a388f8a873bb03f04e8485db218e2089a456d0253d1d1e19cc9973753b34e"
  license "MIT"
  version "3.1.2"

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
