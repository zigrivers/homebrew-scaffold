require "language/node"

class Mmr < Formula
  desc "Multi-model code review CLI — async dispatch, reconciliation, and severity gating"
  homepage "https://github.com/zigrivers/scaffold/tree/main/packages/mmr"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/mmr-v0.6.0.tar.gz"
  sha256 "32a54dd0fbfe12ac13df5cdec4cd3ecea25f350316d05b16e5f8401f8a3885a7"
  license "MIT"
  version "0.6.0"

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
