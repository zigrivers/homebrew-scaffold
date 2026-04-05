require "language/node"

class Mmr < Formula
  desc "Multi-model code review CLI — async dispatch, reconciliation, and severity gating"
  homepage "https://github.com/zigrivers/scaffold/tree/main/packages/mmr"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v3.4.1.tar.gz"
  sha256 "a05c4fe3b45f91829ed44582ca5942e13931471df1fda1a6502d19ffde3843a2"
  license "MIT"

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
