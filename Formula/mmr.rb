require "language/node"

class Mmr < Formula
  desc "Multi-model code review CLI — async dispatch, reconciliation, and severity gating"
  homepage "https://github.com/zigrivers/scaffold/tree/main/packages/mmr"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/mmr-v3.2.0.tar.gz"
  sha256 "10c3fba24ff6f941fd4536427a992c9a050db245c0e33e3edf25c60a4559291a"
  license "MIT"
  version "3.2.0"

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
